class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)

    redirect_to restaurant_path(@comment.review.restaurant)
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to restaurant_path(@comment.review.restaurant)
  end

private

  def comment_params
    params.require(:comment).permit(:review_id, :parent_id, :content, :commenter_id)
  end
end
