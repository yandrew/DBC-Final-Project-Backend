class ListingsController < ApplicationController
	def index
		listings = Listing.all
		@listings = []
		listings.map do |listing|
			
			listing = {
				"name" => "#{listing.product.name}",
				"category" => "#{listing.product.category.name}",
				"description" => "#{listing.product.description}",
				"condition" => "#{listing.product.condition}",
				"created_at" => "#{listing.created_at}",
				"expires_at" => "#{listing.expires_at}",
				"username" => "#{listing.user.username}",
				"max_price" => "#{listing.max_price}",
				"accept_price" => "#{listing.accept_price}"
			}
			@listings << listing.to_json
		end
		
		render json: {listing: @listings}
	end

	def new
	end

	def create
	end

	def show
	end

	def update
	end

	def destroy
	end

end
