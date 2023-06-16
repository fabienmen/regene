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
      biome: session[:bio]
    )
    @land.save

    @offer = Offer.new(
      user: current_user,
      land: @land,
      earning: Earning.last,
      replanted_area: session[:replanted]
    )
    @offer.save
    @carbon_ha = CarbonCreditPrice.last
    @carbon = CreditPerHa.last
    @earning = Earning.new()
    years = ("year_1".."year_30")
    years.each do |year|
      @earning[year] = @carbon_ha[year] * @carbon[year] * session[:replanted].to_i
    end
    @earning.save
    redirect_to my_offers_path
  end

  def meu_perfil
  end
end
