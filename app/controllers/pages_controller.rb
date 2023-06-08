class PagesController < ApplicationController
  def home
    @land = Land.new
    

  end
end
