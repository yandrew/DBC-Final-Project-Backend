class Listing < ActiveRecord::Base
	belongs_to :product
  belongs_to :user
  has_many :bids
  has_many :offers
end
