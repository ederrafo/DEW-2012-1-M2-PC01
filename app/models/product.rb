class Product < ActiveRecord::Base
	has_many   :details
	has_many	 :sales, :through => :details
	attr_accessible :price, :title
end
