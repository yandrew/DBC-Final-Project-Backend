
FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
		password_hash "123"
		name {Faker::Name.name}
		email {Faker::Internet.email}
		avatar {"http://lorempixel.com/175/175/people/#{rand(1..10).to_s}"}
		bio "MyText"
    buyer_rating {rand(1..10)}
    seller_rating {rand(1..10)}
	end

	factory :listing do
    max_price {rand(200..300)}
		accept_price 150
    expires_at {Faker::Time.forward(rand(1..30), :all)}
	end

	factory :offer do
    offer_price
  end

  tfn = ["average,", "mint", "new", "good", "old" ,"working"]

  factory :product do
    name {Faker::Commerce.product_name}
		image_url {"http://lorempixel.com/400/200/technics/#{rand(1..10).to_s}"}
		description {Faker::Hacker.say_something_smart}
		condition {tfn[rand(0..5)]}
    category_id {rand(1..70)}
  end

  factory :rating do
    score {rand(1..10)}
		description "MyText"
		author_id 1
		recipient_id 1
		association :bid_id, factory: :bid
  end

  factory :category do
    name {Faker::Commerce.department}
  end
end