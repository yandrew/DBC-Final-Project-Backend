class Product < ActiveRecord::Base
  belongs_to :user
  has_one :listing
  has_one :offer
  has_one :category
end
