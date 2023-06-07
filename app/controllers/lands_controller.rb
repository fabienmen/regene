class LandsController < ApplicationController
  def index
  end

  def set_location
    session[:location] = params[:land][:address]
    raise
  end
end
