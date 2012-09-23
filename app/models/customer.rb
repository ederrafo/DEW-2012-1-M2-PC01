class Customer < ActiveRecord::Base
  attr_accessible :cart_number, :firstname, :lastname
end
