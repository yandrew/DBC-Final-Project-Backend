class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  belongs_to :offer
  belongs_to :category
  validates :name, :description, :condition, presence: true
  #validates_associated :users
end



