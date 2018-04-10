class WeatherController < ApplicationController
  def index
    @entries = Entry.five_latest
  end

  def locate
    @zip = params[:zip]
    @entry = Entry.new
    @entry.zip = params[:zip]
    zip = params[:zip]
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{zip},us&units=imperial&appid=#{api_key}"
    results = JSON.parse(Http.get(url).body)
    @entry.city = results["name"]
    @entry.humidity = results["main"]["humidity"]
    @entry.pressure = results["main"]["pressure"]
    @entry.temp = results["main"]["temp"]
    @entry.description = results["weather"][0]["description"]
    @entry.sunset = results["sys"]["sunset"]
    @entry.sunrise = results["sys"]["sunrise"]
    @entry.icon = results["weather"][0]["icon"]
    @entry.main = results["weather"][0]["main"]
    @entry.clouds = results["clouds"]["all"]
    if @entry.save
      redirect_to root_path
    else
      ## TODO: add error messages
    end
  end

end
