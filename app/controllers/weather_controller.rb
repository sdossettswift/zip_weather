class WeatherController < ApplicationController
  def index
    @entries = Entry.all
  end

  def locate
  end

end
