file = File.expand_path('../factories', __FILE__)
require_relative 'file'

10.times {
  user = FactoryGirl.create :user
	  rand(10).times {
	  	listing = FactoryGirl.create :listing, :user => user
	    listing.
	  }
	  rand(10).times {
	  	offer = FactoryGirl.create :offer, :user => user
	    tweet = FactoryGirl.create :tweet, :user => user
	    hashtag.tweets << tweet
	  }
}
    



 factory :user do

factory :listing 
factory :offer do
factory :product 
factory :bid do
 
factory :rating d
factory :category