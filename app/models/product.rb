class Product < ActiveRecord::Base
	before_save :get_suggested_items
	validates_inclusion_of :price, :in => 1000..10000, :message => "not the right amount"



	def get_suggested_items
		@suggested_items = []
		new_price = self.price
		products = Product.all
		products.each do |product, difference|
			price = product.price
			old_difference = new_price - product.price
			difference = (new_price - product.price).abs
			
			while difference < old_difference 
				@suggested_items << product
			end

	end

end
