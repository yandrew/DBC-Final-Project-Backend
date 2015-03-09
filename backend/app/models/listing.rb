class Listing < ActiveRecord::Base
	has_one :product
  belongs_to :user
  has_many :offers
  belongs_to :rating
  before_save :add_user_id

  def add_user_id
  	self.user_id = self.product.user_id
  end
end
