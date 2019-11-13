class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurnt
    if @review.save
      redirect_to restaurant_path(@restaurnt)
    else
      render :new
    end
  end

  private
  def reviews_params
    params.require(:reviews).permit(:content, :rating)   
  end
end
