class ListingsController < ApplicationController
	def index
		listings = Listing.all
		@listings = []
		listings.map do |listing|
			@listing = {
				"listing_id" => listing.id,
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
				"lowest_offer" => listing.offers.order(created_at: :desc).first.offer_price
			}
			@listings << @listing
		end
		render json: @listings
	end

	def create
		@user = User.find(params[:user_id])
		@product = @user.products.create(name: params[:name], description: params[:description], image_url: params[:image_url], category_id: params[:category_id])
		@product.create_listing(max_price: params[:max_price], accept_price: params[:accept_price], expires_at: params[:expires_at])

		
	end

	def show
		listing = Listing.find(params[:id])
		@offers = []
		@listing = []
		offers = listing.offers
		offers.map do |offer|
			if offer.valid
				@offer = {
					"offer_id" => offer.id,
					"product_id" => offer.product.id,
					"name" => offer.product.name,
					"image_url" => offer.product.image_url,
					"description" => offer.product.description,
					"condition" => offer.product.condition,
					"created_at" => offer.created_at,
					"offer_price" => offer.offer_price,
					"seller" => offer.user
					}
			end
			@offers << @offer
		end

		listing_info = {
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
			"lowest_offer" => listing.offers.order(created_at: :desc).first.offer_price,
			"offers" => @offers
		}
		@listing = listing_info

		render json: @listing
	end

	def update
	end



	def destroy
	end

end
