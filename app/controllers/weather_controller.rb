class WeatherController < ApplicationController
  def index
    @entries = Entry.five_latest
  end

  def locate
    @zip = params[:zip]
    @entry = Entry.new
    @entry.zip = params[:zip]
    if @entry.save
      redirect_to root_path
    else
      render('locate')
      ## TODO: add error messages
    end
  end

end
