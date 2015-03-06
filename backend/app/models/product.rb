class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  belongs_to :offer
  has_one :category
end
