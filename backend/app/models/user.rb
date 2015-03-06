class User < ActiveRecord::Base
	has_many :listings
	has_many :offers
	has_many :products
	has_many :products, through: :listings
	has_many :products, through: :offers
end
