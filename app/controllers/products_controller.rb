class ProductsController < ApplicationController

	def create
		@product = Product.new(product_params)
		if @product.save
			@suggested_items = Product.get_suggested_items(@product.price).limit(6)
			redirect_to product_path(@product.id)
		else
			flash[:notice] = "Remember, product must be between $1,000 and $10,000"
			render :new
		end
	end

  def new
  	@product = Product.new
  end

  def show
  	@product = Product.find(params[:id])
  	@suggested_items = Product.get_suggested_items(@product.price).limit(5)
  	if @suggested_price
  		@product.price = new_price
  		@product.save
  	end
  end

  def update
  	@product = Product.find(params[:id])
	  	if @product.update(price: params[:price])
	  		redirect_to root_path
	  	end
  end

  def index
  	@products = Product.all
  end

  private

  def product_params
		params.require(:product).permit(:name, :price, :original_price, :furniture_type, :suggested_price)
	end

end
