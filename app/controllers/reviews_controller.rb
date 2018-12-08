class ReviewsController < ApplicationController

before_filter :authorize

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user

    if @review.save
      redirect_to @product
    else
      redirect_to '/'
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end
end
