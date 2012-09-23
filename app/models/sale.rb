class Sale < ActiveRecord::Base
	belongs_to :customer	
	has_many   :details
	has_many	 :products, :through => :details
	attr_accessible :customer_id, :total,:product_ids
end
