class ProductsController < ApplicationController

  def create
    binding.pry
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      flash[:notice] = "Remember, product must be between $1,000 and $10,000"
      render :new
    end
  end

  def new
    @product = Product.new
    @furniture_types = Product.all.map {|product| product.furniture_type}.uniq
  end

  def set_price
    @product = Product.new(product_params)
    @suggested_items = Product.get_suggested_items(product_params[:original_price], product_params[:furniture_type]).limit(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :original_price, :furniture_type, :suggested_price)
  end

end
