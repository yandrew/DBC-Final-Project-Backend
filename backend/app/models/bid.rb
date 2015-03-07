class Bid < ActiveRecord::Base
  belongs_to :listing
  has_one :offer
  has_many :ratings
end
