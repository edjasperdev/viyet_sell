class Product < ActiveRecord::Base
	before_save :get_suggested_items

	def get_suggested_items
		puts "hey"
	end

end
