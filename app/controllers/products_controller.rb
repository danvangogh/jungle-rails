class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    puts "hello world"
    render json: @products
    # render('views/products/index.html.erb', templateVars = {@products})
  end

  def show
    @product = Product.find params[:id]
    @review = Review.create
  end

end
