class Product < ActiveRecord::Base
	validates_presence_of :name, :original_price
	validates_inclusion_of :price, :in => 1000..10000

	def self.get_suggested_items(original_price, furniture)
		#SQL query that selects 5 products near 60% of original price and of the same furniture type
  	where("furniture_type = ?", "#{furniture}").order("abs(products.price - #{original_price}/0.60)")
  end

end
