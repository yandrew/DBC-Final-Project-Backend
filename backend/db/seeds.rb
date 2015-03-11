file = File.expand_path('../factories', __FILE__)
require_relative file

categories = []
require 'csv'

csv_file = File.expand_path('../categories.csv', __FILE__)

CSV.foreach(csv_file) do |row|
	row[0].gsub!("&", "and")
	categories << row
end

CATEGORIES = []
categories.map! {|x| x[0].split(/[>]/)}

categories.each do |x|
	CATEGORIES << x[1].to_s.strip!
end

categories = CATEGORIES.uniq!
categories.shift
categories.each do |category|
	Category.create(name: category)
end
p categories
p categories.length

User.create(username: 'test', password: 'test', name:Faker::Name.name, email: Faker::Internet.email, avatar: "http://lorempixel.com/175/175/people/#{rand(1..10).to_s}", bio: "MyText", buyer_rating: rand(1..10), seller_rating: rand(1..10))
# 20.times {
# 	user1 = FactoryGirl.create :user

# 	user2 = FactoryGirl.create :user

# 	product = FactoryGirl.create :product
# 	user1.products << product
# 	product.save
# 	product.create_listing(max_price: rand(200..300), accept_price: 150, expires_at: Faker::Time.forward(rand(1..30), :all))
# 	user1.save

	
# 	product1 = FactoryGirl.create :product
# 	user2.products << product1
# 	product1.save
# 	product1.create_listing(max_price: rand(200..300), accept_price: 150, expires_at: Faker::Time.forward(rand(1..30), :all))
# 	user2.save
	

# 	product2 = FactoryGirl.create :product
# 	user1.products << product2
# 	user1.save
# 	product2.create_offer(offer_price: 175)
# 	product2.save

# 	product3 = FactoryGirl.create :product
# 	user1.products << product3
# 	user1.save
# 	product3.create_offer(offer_price: 175)
# 	product3.save

# 	product4 = FactoryGirl.create :product
# 	user2.products << product4
# 	user2.save
# 	product4.create_offer(offer_price: 155)
# 	product4.save

# 	product5 = FactoryGirl.create :product
# 	user2.products << product5
# 	user2.save
# 	product5.create_offer(offer_price: 155)
# 	product5.save

# 	product.listing.offers << product2.offer
# 	sleep 2

# 	product1.listing.offers << product3.offer
# 	sleep 2

# 	product.listing.offers << product4.offer
# 	sleep 2

# 	product1.listing.offers << product5.offer

# 	product.save
# 	product1.save
# }


