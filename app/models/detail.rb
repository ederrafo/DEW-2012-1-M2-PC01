class Detail < ActiveRecord::Base
	belongs_to :sale
	belongs_to :product
	attr_accessible :product_id, :sale_id
end
