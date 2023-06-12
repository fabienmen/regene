class LandsController < ApplicationController
  # skip_before_action :verify_authenticity_token, if: :json_request?
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:set_replanted_area, :set_total_area, :set_location, :store_demo_value, :store_replanted]

  def set_replanted_area
    @carbon = CarbonCreditPrice.last
    @carbon_price = CreditPerHa.last
    @offer = Offer.new
    @land = Land.new
    @total = @carbon.year_1 * @carbon_price.year_1
    session[:total_area] = params["land"]["total_area"]
    @size = session[:total_area]
  end

  def new_offer

  end

  def index
  end

  def set_location
  end

  def set_total_area
    @land = Land.new
  end

  def store_demo_value
    session[:location] = params[:location]
    session[:latitude] = params[:latitude]
    session[:longitude] = params[:longitude]
  end

  def store_replanted
    session[:replanted] = params[:replanted]
  end

end
