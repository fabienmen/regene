class OffersController < ApplicationController
  before_action :set_offer, only: [ :edit_set_location, :edit_set_total_area, :store_edit_value, :edit_set_replanted_area, :edit_store_replanted ]

  skip_before_action :verify_authenticity_token


  def index
    @offers = Offer.all
    @offers = @offers.where(user_id: current_user)
  end

  def edit_set_replanted_area
    @carbon = CarbonCreditPrice.last
    @carbon_ha = CreditPerHa.last
    years = ("year_1".."year_30")
    monthly_averages = []
    years.each do |year|
      monthly_averages << @carbon[year] * @carbon_ha[year] / 12
    end
    @total = monthly_averages.sum(0.0) / monthly_averages.size
    @land = @offer.land
    @land.total_area = params[:land][:total_area]
    @land.save
  end

  def store_edit_value
    @land = @offer.land
    @land.latitude = params[:latitude]
    @land.longitude = params[:longitude]
    @land.address = params[:location]
    @land.save
  end

  def edit_set_total_area
    @land = @offer.land
  end

  def edit_set_location
  end

  def edit_store_replanted
    @offer.replanted_area = params[:replanted]
    @offer.save
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit( :active, :replanted_area )
  end
end
