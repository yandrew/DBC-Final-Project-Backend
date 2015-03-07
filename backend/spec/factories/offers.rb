FactoryGirl.define do
  factory :offer do
    offer_price {Faker::Commerce.price.to_s}
    	factory :offer_with_product do
		    after(:create) do |offer|
		      create(:product, offer: offer)
		    end
		  end
  end
end
