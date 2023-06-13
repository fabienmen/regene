class OffersController < ApplicationController
  before_action :set_offer, only: [ :edit, :update, :edit_set_location, :edit_set_total_area ]

  def new

  end

  def index
    @offers = Offer.all
    @offers = @offers.where(user_id: current_user)
  end

  def edit

  end
  
  def edit_set_replanted_area
    @land = Land.find(params[:id])
    @land.total_area = params[:land][:total_area]
    @land.save
  end

  def store_edit_value
    @land.latitude = params[:latitude]
    @land.longitude = params[:longitude]
    @land.address = params[:location]
    @land.save
  end

  def update_set_replanted_area

  end

  def edit_set_total_area
    @land = @offer.land
  end

  def edit_set_location
  end

  def update_set_total_area
    raise
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit( :active, :replanted_area )
  end
end
