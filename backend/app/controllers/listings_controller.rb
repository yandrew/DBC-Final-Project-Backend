class ListingsController < ApplicationController
	def index
		listings = Listing.all
		@listings = []
		listings.map do |listing|
			
			listing = {
				"listing_id" => listing.id,
				"product_id" => listing.product.id,
				"name" => "#{listing.product.name}",
				"category" => "#{listing.product.category.name}",
				"image_url" => "#{listing.product.image_url}",
				"description" => "#{listing.product.description}",
				"condition" => "#{listing.product.condition}",
				"created_at" => "#{listing.created_at}",
				"expires_at" => "#{listing.expires_at}",
				"username" => "#{listing.user.username}",
				"max_price" => listing.max_price,
				"accept_price" => listing.accept_price
			}
			@listings << listing
		end
		
		render json: {listing: @listings}
	end

	def create
		
	end

	def show
		listing = Listing.find(params[:id])
		offers = listing.bids.map {|bid| bid.offer}
		@offers = []
		@listing = []
		offers.map do |offer|
			
			offer = {
				"product_id" => offer.product.id,
				"name" => "#{offer.product.name}",
				"image_url" => "#{offer.product.image_url}",
				"description" => "#{offer.product.description}",
				"condition" => "#{offer.product.condition}",
				"created_at" => "#{offer.created_at}",
				"offer_price" => offer.offer_price,
				"seller" => offer.user
			}
			@offers << offer
		end

		listing = {
			"listing_id" => listing.id,
			"product_id" => listing.product.id,
			"name" => "#{listing.product.name}",
			"category" => "#{listing.product.category.name}",
			"image_url" => "#{listing.product.image_url}",
			"description" => "#{listing.product.description}",
			"condition" => "#{listing.product.condition}",
			"created_at" => "#{listing.created_at}",
			"expires_at" => "#{listing.expires_at}",
			"username" => "#{listing.user.username}",
			"max_price" => listing.max_price,
			"accept_price" => listing.accept_price,
			"offers" => @offers
		}
		@listing << listing
		puts listing

		render json: {listing: @listing}
	end

	def update
	end

	def destroy
	end

end
