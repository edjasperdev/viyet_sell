class ProductsController < ApplicationController
	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to("/")
	end

  def new
  	@product = Product.new
  end

  def index
  end

  private

  def product_params
		params.require(:product).permit(:name, :price, :original_price, :furniture_type, :suggested_price)
	end

end
