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

5.times {
	user = FactoryGirl.create :user
	product = FactoryGirl.create :product, :user => user
	product.update(category_id: rand(1..40))
	user.products << product
}
20.times {
	user = FactoryGirl.create :user
	rand(5).times {
		listing = FactoryGirl.create :listing, :user => user
		product1 = FactoryGirl.create :product
		product1.update(category_id: rand(1..40))
		listing.product = product1
		offer2 = FactoryGirl.create :offer, :user => user
		product2 = FactoryGirl.create :product
		product2.update(category_id: rand(1..40))
		offer2.product = product2
		offer3 = FactoryGirl.create :offer, :user => user
		product3 = FactoryGirl.create :product
		product3.update(category_id: rand(1..40))
		offer3.product = product3
		offer4 = FactoryGirl.create :offer, :user => user
		product4 = FactoryGirl.create :product
		product4.update(category_id: rand(1..40))
		offer4.product = product4
		listing.bids << offer2.create_bid
		listing.bids << offer3.create_bid
		listing.bids << offer4.create_bid
		listing.save
	}
}


