class Offer < ActiveRecord::Base
	belongs_to :product
  belongs_to :user
  has_one :bid
  has_many :listings
end
