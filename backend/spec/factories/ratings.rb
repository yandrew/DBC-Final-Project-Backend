FactoryGirl.define do
  factory :rating do
    score {rand(1..10)}
		description "MyText"
		author_id 1
		recipient_id 1
		bid nil
  end

end
