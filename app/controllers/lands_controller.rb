class LandsController < ApplicationController

  def index
  end

  def set_location
    session[:location] = params[:land][:address]
  end

  def set_total_area
    @land = Land.new
  end
end
