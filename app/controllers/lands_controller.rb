class LandsController < ApplicationController

  def set_replanted_area
    @carbon = CarbonCreditPrice.last
    @carbon_price = CreditPerHa.last
    @offer = Offer.new
    @total = @carbon.year_1 * @carbon_price.year_1
    session[:total_area] = params["land"]["total_area"]
    @ola = session[:total_area]
  end

  def index
  end

  def set_location

   session[:location] = params[:land][:address]

  end

  def set_total_area
    @land = Land.new

  end

  def store_demo_value
    session[:demo_value] = params[:demoValue]
    head :ok
  end
end
