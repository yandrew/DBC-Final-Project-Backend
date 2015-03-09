class Offer < ActiveRecord::Base
	belongs_to :product
  belongs_to :user
  has_one :bid
  has_many :listings



  def invalid_offer
  		self.valid = false
  end
end
