class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    redirect_to restaurant_path(@review.restaurant)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    redirect_to restaurant_path(@review.restaurant)

  end

  def destroy
    @review = Review.find(params[:id])
    restaurant = @review.restaurant
    @review.destroy

    redirect_to restaurant_path(restaurant)

  end



private

  def review_params
    params.require(:review).permit(:reviewer_id, :restaurant_id, :title, :content)
  end

end
