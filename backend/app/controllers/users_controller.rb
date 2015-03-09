class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def create
	end
	def listings
		@user = User.find(params[:user_id])
		listings = @user.listings
		@listings = []
		listings.map do |listing|
			@offers = []
			listing.bids.order(created_at: :desc).map do |bid|
				@offer = {
					"product_id" => bid.offer.product.id,
					"name" => bid.offer.product.name,
					"image_url" => bid.offer.product.image_url,
					"description" => bid.offer.product.description,
					"condition" => bid.offer.product.condition,
					"created_at" => bid.offer.created_at,
					"offer_price" => bid.offer.offer_price,
					"seller" => bid.offer.user
					}
				@offers << @offer
			end
			@listing = {
				"listing_id" => listing.id,
				"product_id" => listing.product.id,
				"name" => listing.product.name,
				"category" => listing.product.category.name,
				"image_url" => listing.product.image_url,
				"description" => listing.product.description,
				"condition" => listing.product.condition,
				"created_at" => listing.created_at,
				"expires_at" => listing.expires_at,
				"username" => listing.user.username,
				"max_price" => listing.max_price,
				"accept_price" => listing.accept_price,
				"lowest_offer" => listing.bids.order(created_at: :desc).first.offer.offer_price,
				"offers" => @offers
				}
			@listings << @listing
		end
		render json: @listings
	end

	def offers
		@user = User.find(params[:user_id])
		@offers = @user.offers
		@listings = []
		@offers.map do |offer|
			listing = {
			"listing_id" => offer.bid.listing.id,
			"product_id" => offer.bid.listing.product.id,
			"name" => offer.bid.listing.product.name,
			"category" => offer.bid.listing.product.category.name,
			"image_url" => offer.bid.listing.product.image_url,
			"description" => offer.bid.listing.product.description,
			"condition" => offer.bid.listing.product.condition,
			"created_at" => offer.bid.listing.created_at,
			"expires_at" => offer.bid.listing.expires_at,
			"username" => offer.bid.listing.user.username,
			"max_price" => offer.bid.listing.max_price,
			"accept_price" => offer.bid.listing.accept_price,
			"lowest_offer" => offer.bid.listing.bids.order(created_at: :desc).first.offer.offer_price,
			"your_offer" => offer.offer_price
			}
			@listings << listing
		end
		render json: @listings
	end


		
end
