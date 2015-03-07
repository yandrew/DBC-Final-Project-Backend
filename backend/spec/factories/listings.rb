FactoryGirl.define do
	factory :listing do
    max_price {Faker::Commerce.price.to_s}
		base_price {Faker::Commerce.price.to_s}
			factory :listing_with_product do
		    after(:create) do |listing|
		      create(:product, listing: listing)
		    end
		  end
  end

end
