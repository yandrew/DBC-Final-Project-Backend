class Product < ActiveRecord::Base
  belongs_to :user
  has_many :listings
  has_many :offers
  belongs_to :category
end
