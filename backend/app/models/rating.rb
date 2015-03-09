class Rating < ActiveRecord::Base
  has_one :listing
  has_one :offer
  belongs_to :user
end
