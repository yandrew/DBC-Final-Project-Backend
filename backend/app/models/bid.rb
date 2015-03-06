class Bid < ActiveRecord::Base
  belongs_to :listing
  belongs_to :offer
  has_many :ratings
end
