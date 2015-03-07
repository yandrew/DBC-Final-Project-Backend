FactoryGirl.define do
  factory :product do
    name {Faker::Commerce.product_name}
		image_url "MyText"
		description "MyText"
		condition "MyString"
  end

end
