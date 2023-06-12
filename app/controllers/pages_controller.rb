class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :offer]


  def home
  end

  def offer
    @land = Land.new(
      total_area: session[:total_area],
      latitude: session[:latitude],
      longitude: session[:longitude],
      address: session[:location],
      biome: "Amazonica"
    )
    @land.save
    @offer = Offer.new(
      user: current_user,
      land: @land,
      earning: Earning.last,
      replanted_area: session[:replanted]
    )
    @offer.save
  end
end
