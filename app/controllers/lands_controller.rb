class LandsController < ApplicationController

  def set_replanted_area
    @carbon = CarbonCreditPrice.last
    @carbon_price = CreditPerHa.last
    @total = @carbon.year_1 * @carbon_price.year_1

  def index
  end

  def set_location

   # session[:location] = params[:land][:address]

  end
end
