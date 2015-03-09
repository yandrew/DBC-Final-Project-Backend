class Offer < ActiveRecord::Base
	has_one :product
  belongs_to :user
  belongs_to :listings
  belongs_to :rating
  before_save :add_user_id


  def invalid_offer
  		self.valid = false
  end

  def add_user_id
  	self.user_id = self.product.user_id
  end

end
