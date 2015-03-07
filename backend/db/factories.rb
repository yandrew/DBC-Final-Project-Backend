FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
		password_hash "123"
		name {Faker::Name.name}
		email {Faker::Internet.email}
		avatar {Faker::Avatar.image}
		bio "MyText"
	end

	factory :listing do
    max_price {Faker::Commerce.price.to_s}
		base_price {Faker::Commerce.price.to_s}
	end

	factory :offer do
    offer_price {Faker::Commerce.price.to_s}
  end