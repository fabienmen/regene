class PagesController < ApplicationController
  def home
    @land = Land.new
  end

  def offer
    # session[:demo_value]
    # session[:demo_latitude]
    # session[:demo_longitude]
    # session[:demo_replanted]
  end

  def meu_perfil
  end
end
