class ProductsController < ApplicationController

	before_filter = :ensure_logged_in, :only => [:create]


  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	if current_user
  		@review = @product.reviews.build
  	end
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end
end
