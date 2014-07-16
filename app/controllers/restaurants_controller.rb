class RestaurantsController < ApplicationController

  def search
    @restaurants = Restaurant.search params[:search]
  end
end
