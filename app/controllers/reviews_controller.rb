class ReviewsController < ApplicationController

  before_action :require_login

  def index
    if params[:restaurant_id]
      @reviews=Restaurant.find(params[:restaurant_id]).reviews.non_empty_reviews
    end
  end

  def new
    # use nested routes to get restaurant_id
    @review=Review.new(user_id:current_user.id,restaurant_id:params[:restaurant_id])
  end

  def create
    @review=Review.new(review_params)

    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :restaurant_id, :user_id)
  end

end
