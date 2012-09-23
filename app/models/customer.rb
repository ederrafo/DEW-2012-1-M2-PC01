class Customer < ActiveRecord::Base
  
  has_many	 :sales
  attr_accessible :cart_number, :firstname, :lastname

end
