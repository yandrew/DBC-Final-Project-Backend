class Bid < ActiveRecord::Base
  belongs_to :listing
  has_one :offer
  has_many :ratings
  before_update :remove_from_listing


  def remove_from_listing
  	if self.invalid == true
  		self.listing_id = nil
  	end
  end
end
