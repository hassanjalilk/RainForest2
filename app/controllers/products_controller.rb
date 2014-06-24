class ProductsController < ApplicationController

	before_filter :ensure_logged_in, :only => [:create]
	


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

  def update
  	@product = Product.find(param[:id])
  	@product.update.attribute(product_params)
  	redirect_to product_path(@product)
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.delete
  	redirect_to products_path
  end

  def private_params
  	params.require(:product).permit(:name, :url, :description, :price_in_cents)
  end

end


