class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @image = Image.create(image_params)
    redirect_to restaurant_path(@restaurant)
  end

  private
  def image_params
    params.require(:image).permit(:caption, :restaurant_id, :user_id, :image)
  end
end
