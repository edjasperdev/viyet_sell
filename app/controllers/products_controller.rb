class ProductsController < ApplicationController

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to("/")
		else
			flash[:notice] = "Remember, product must be between $1,000 and $10,000"
			render :new
		end
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
