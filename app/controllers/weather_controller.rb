class WeatherController < ApplicationController
  def index
    @entries = Entry.all
  end

  def locate
    @zip = params[:zip]
    @entry = Entry.new
    @entry.zip = params[:zip]
    if @entry.save
      redirect_to root_path
    else
      render('locate')
    end
  end

end
