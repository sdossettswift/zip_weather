class EntriesController < ApplicationController
  def index
    @entries = Entry.has_city.five_latest
    @entry = Entry.new
    @current_location = session[:location]
    @latest = Entry.last
  end

  def new
    @entry = Entry.new
    @zip = params[:zip]
  end

  def create
    @entry = Entry.new
    zip = params["entry"]["zip"]
    api_key=ENV["API_KEY"]
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{zip},us&units=imperial&appid=#{api_key}"
    results = JSON.parse(Http.get(url).body)
      if results["cod"]=="404"
        redirect_to entries_path,
        notice: 'Zipcode not recognized. Please try again.'
        return
      end

    @entry.zip = zip

    if @entry.save(entry_params)
      session[:location]=params["entry"]["zip"]
      @entry.city = results["name"]
      @entry.humidity = results["main"]["humidity"]
      @entry.pressure = results["main"]["pressure"]
      @entry.wind_speed = results["wind"]["speed"]
      @entry.wind_direction = results["wind"]["deg"]
      @entry.temp = results["main"]["temp"]
      @entry.description = results["weather"][0]["description"]
      @entry.sunset = results["sys"]["sunset"]
      @entry.sunrise = results["sys"]["sunrise"]
      @entry.icon = results["weather"][0]["icon"]
      @entry.main = results["weather"][0]["main"]
      @entry.clouds = results["clouds"]["all"]
      @entry.save
      redirect_to entries_path,
      notice: 'Weather successfully logged.'
    else
      render :new,
      notice: "Something was wrong with your request."
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:zip, :city, :humidity, :pressure, :wind_direction, :wind_speed,
    :temp, :description, :sunset, :sunrise, :icon, :main, :cloud)
  end
end
