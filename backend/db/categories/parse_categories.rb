

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
p categories
