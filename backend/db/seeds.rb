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

categories.each do |category|
	Category.create(name: category)
end


20.times {
	user1 = FactoryGirl.create :user

	user2 = FactoryGirl.create :user

	listing = FactoryGirl.create :listing, :user => user1
	product = FactoryGirl.create :product
	product.update(category_id: rand(1..70))
	listing.product = product
	user1.products << product
	user1.save
	product.save

	listing1 = FactoryGirl.create :listing, :user => user2
	product1 = FactoryGirl.create :product
	product1.update(category_id: rand(1..70))
	listing1.product = product1
	user2.products << product1
	user2.save
	product1.save

	offer2 = FactoryGirl.create :offer, :user => user1
	product2 = FactoryGirl.create :product
	product2.update(category_id: rand(1..70))
	offer2.product = product2
	user1.products << product2
	user1.save
	product2.save

	offer3 = FactoryGirl.create :offer, :user => user1
	product3 = FactoryGirl.create :product
	product3.update(category_id: rand(1..70))
	offer3.product = product3
	user1.products << product3
	user1.save
	product3.save

	offer4 = FactoryGirl.create :offer, :user => user2
	product4 = FactoryGirl.create :product
	product4.update(category_id: rand(1..70))
	offer4.product = product4
	user2.products << product4
	user2.save
	product4.save

	offer5 = FactoryGirl.create :offer, :user => user2
	product5 = FactoryGirl.create :product
	product5.update(category_id: rand(1..70))
	offer5.product = product5
	user2.products << product5
	user2.save
	product5.save

	listing.bids << offer2.create_bid
	sleep 2

	listing1.bids << offer3.create_bid
	sleep 2

	listing.bids << offer4.create_bid
	sleep 2

	listing1.bids << offer5.create_bid

	listing.save
	listing1.save
}


