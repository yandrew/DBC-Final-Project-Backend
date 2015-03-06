FactoryGirl.define do
  factory :offer do
    offer_price {Faker::Commerce.price.to_s}
		user nil
  end

end
