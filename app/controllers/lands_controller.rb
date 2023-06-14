class LandsController < ApplicationController
  # skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :set_land, only: [ :update, :store_edit_value ]

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:set_replanted_area, :set_total_area, :set_location, :store_demo_value, :store_replanted]


  def set_replanted_area
    @carbon = CarbonCreditPrice.last
    @carbon_ha = CreditPerHa.last
    @offer = Offer.new
    @land = Land.new
    years = ("year_1".."year_30")
    monthly_averages = []
    years.each do |year|
      monthly_averages << @carbon[year] * @carbon_ha[year] / 12
    end
    @total = monthly_averages.sum(0.0) / monthly_averages.size
    session[:total_area] = params["land"]["total_area"]
    @size = session[:total_area]
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

  private

  def set_land
    @land = Land.find(params[:id])
  end

  def land_params
    params.require(:land).permit( :registration_number, :total_area, :latitude, :longitude, :address, :biome )
  end

end
