file = File.expand_path('../factories', __FILE__)
require_relative file

10.times {
	user = FactoryGirl.create :user
	product = FactoryGirl.create :product, :user => user
	user.products << product
	rand(10).times {
		listing = FactoryGirl.create :listing, :user => user
		product1 = FactoryGirl.create :product
		listing.product = product1
		offer = FactoryGirl.create :offer, :user => user
		product2 = FactoryGirl.create :product
		offer.product = product2
		listing.bids << offer.create_bid
		listing.save
		offer.save
	}
}

categories = []
require 'csv'

csv_file = File.expand_path('../categories.csv', __FILE__)

CSV.foreach(csv_file) do |row|
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
