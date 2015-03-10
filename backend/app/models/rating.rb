class Rating < ActiveRecord::Base
  has_one :listing
  has_one :offer
  belongs_to :user

  def seller_rating_avg
  	
  end
  def buyer_rating_avg
  end
end
