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
		product_id
		association :user_id, factory: :user
		association :product_id, factory: :product
	end

	factory :offer do
    offer_price {Faker::Commerce.price.to_s}
    product_id
    association :user_id, factory: :user
    association :product_id, factory: :product
  end

  factory :product do
    name {Faker::Commerce.product_name}
		image_url "MyText"
		description "MyText"
		condition "MyString"
  end

  factory :bid do
    transaction false
    association :listing_id, factory: :listing
    association :offer_id, factory: :offer
  end

  factory :rating do
    score {rand(1..10)}
		description "MyText"
		author_id 1
		recipient_id 1
		association :bid_id, factory: :bid
  end

  factory :category do
    name "MyString"
    association :product_id, factory: :product
  end
end