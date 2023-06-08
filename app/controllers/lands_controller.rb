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

  def index
  end

  def set_location
    @lands = Land.geocoded
    # @markers = @lands.map do |land|
    # {
    #   lat: land.latitude,
    #   lng: land.longitude,
    #   info_window_html: render_to_string(partial: "info_window", locals: {land: land}),
    #   marker_html: render_to_string(partial: "marker")
    # }
    # end
  #  session[:location] = params[:land][:address]


  end

  def set_total_area
    @land = Land.new

  end

  def store_demo_value
    raise
    session[:demo_value] = params[:demoValue]
    redirect_to set_total_area_path
    raise
    # head :ok
  end

  protected

  # def json_request?
  #   request.format.json?
  # end
end
