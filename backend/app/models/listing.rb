class Listing < ActiveRecord::Base
	has_one :product
  belongs_to :user
  has_many :bids
end
