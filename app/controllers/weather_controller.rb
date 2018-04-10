class WeatherController < ApplicationController
  def index
    @entries = Entry.five_latest
    @entry = Entry.last
  end

  def locate
    @zip = params[:zip]
    @entry = Entry.new
    @entry.zip = params[:zip]
    if @entry.save
      redirect_to root_path
    else
      ## TODO: add error messages
    end
  end

end
