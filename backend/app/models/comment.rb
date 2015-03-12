class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :offer
  belongs_to :listing
end
