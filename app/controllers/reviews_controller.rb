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

    def destroy
      @product = Product.find params[:product_id]
      @review = Review.find params[:id]
      @review.destroy
      redirect_to @product, notice: 'Review Deleted'
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
