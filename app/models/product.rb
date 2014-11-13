class Product < ActiveRecord::Base
	validates_inclusion_of :price, :in => 1000..10000
	
	def self.get_suggested_items(price)
    order("abs(products.price - #{price})")
  end


	# def get_suggested_items
	# 	@suggested_items = []
	# 	new_price = self.price
	# 	products = Product.all
	# 	products.each do |product, difference|
	# 		price = product.price
	# 		old_difference = new_price - product.price
	# 		difference = (new_price - product.price).abs

	# 		while difference < old_difference 
	# 			@suggested_items << product
	# 		end

	# end



end
