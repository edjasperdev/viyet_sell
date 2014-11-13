class Product < ActiveRecord::Base
	validates_inclusion_of :price, :in => 1000..10000
	
	def self.get_suggested_items(price)
    order("abs(products.price - #{price})")
  end

end
