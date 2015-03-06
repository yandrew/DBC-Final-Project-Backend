FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
		password_hash "123"
		name {Faker::Name.name}
		email {Faker::Internet.email}
		avatar {Faker::Avatar.image}
		bio "MyText"
		rating {rand(1..10)}
			factory :user_with_listing do
		    after(:create) do |user|
		      create(:listing, user: user)
		    end
		  end
		  factory :user_with_offer do
		    after(:create) do |user|
		      create(:offer, user: user)
		    end
		  end
  end
end
