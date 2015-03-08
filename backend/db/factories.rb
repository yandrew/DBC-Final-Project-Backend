
FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
		password_hash "123"
		name {Faker::Name.name}
		email {Faker::Internet.email}
		avatar {"http://lorempixel.com/175/175/people/#{rand(1..10).to_s}"}
		bio "MyText"
    rating {rand(1..10)}
	end

	factory :listing do
    max_price {rand(200..300)}
		accept_price {rand(50)}
    expires_at {Faker::Time.forward(rand(1..30), :all)}
	end
  range = [1.99, 49.99, 50.99, 99.99, 100.99, 149.99, 150.99, 199.99]
  @a = range.pop
  @b = range.pop
	factory :offer do
    offer_price {rand(1.0..200.0)}
  end

  tfn = ["average,", "mint", "new", "good", "old" ,"working"]

  factory :product do
    name {Faker::Commerce.product_name}
		image_url {"http://lorempixel.com/400/200/technics/#{rand(1..10).to_s}"}
		description {Faker::Commerce.color}
		condition {tfn[rand(0..5)]}
  end

  factory :bid do
    purchased false
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