class LandsController < ApplicationController
  # skip_before_action :verify_authenticity_token, if: :json_request?
  skip_before_action :verify_authenticity_token

  def set_replanted_area
    @carbon = CarbonCreditPrice.last
    @carbon_price = CreditPerHa.last
    @offer = Offer.new
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
    session[:demo_value] = params[:demoValue]
    session[:demo_latitude] = params[:demoLatitude]
    session[:demo_longitude] = params[:demoLongitude]
    # session[:demo_replanted]
  end

  def store_replanted
    # session[:demo_value] = session[:demo_value]
    # session[:demo_latitude] = session[:demo_latitude]
    # session[:demo_longitude] = session[:demo_longitude]
    puts "set session"
    session[:demo_replanted] = params[:demoReplanted]
    puts "session saved #{session[:demo_replanted]}"
  end

end
