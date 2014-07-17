class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def search
    @results = Restaurant.search(params[:search])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
