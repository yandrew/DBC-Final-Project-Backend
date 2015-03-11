class ListingsController < ApplicationController
	
	def index
		listings_to_send = []
		Listing.all.each do |listing|
			if listing.offers == []
				lowest_offer = 0
			else
				lowest_offer =  listing.offers.order(created_at: :desc).first.offer_price
			end
			p "on index show"
			p listing.product
			p listing.user
			if listing.product && listing.user
				 listing_to_send = {
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
					"lowest_offer" => lowest_offer
				}
			else
				listing_to_send = {
				"listing_id" => listing.id,
				"created_at" => listing.created_at,
				"expires_at" => listing.expires_at,
				"max_price" => listing.max_price,
				"accept_price" => listing.accept_price,
				"lowest_offer" => lowest_offer
			 }			
			end
			listings_to_send << listing_to_send
		end
		puts listings_to_send
		render json: listings_to_send
	end

	#fixed
	def create

		listing = Listing.new(max_price: params[:max_price], accept_price: params[:accept_price], user_id: params[:user_id], expires_at: params[:expires_at], rating_id: 1 );
		listing.save
		puts listing.errors.full_messages
		product = Product.create(name: params[:name], description: params[:description], condition: params[:condition], image_url: params[:image_url], user_id: params[:user_id], listing_id: listing.id, category_id: params[:category_id])

		if product && listing
			render text: "Listing #{listing.id} and product #{product.id} have been created"
		elsif product
			render text: "Failed to create listing"
		elsif listing
			render text: "Failed to create listing"
		else
			render text: "Failed to create listing and product. You are screwed"
		end

		# @user = User.find(params[:user_id]) if params[:user_id]
		# if @user
		# 	@user.products.create(name: params[:name], description: params[:description], image_url: params[:image_url], category_id: params[:category_id]).create_listing(max_price: params[:max_price], accept_price: params[:accept_price], expires_at: params[:expires_at])
		# 	render text: "Listing has been created"
		# else
		# 	render text: "Must be logged in to create a listing"
		# end
	end

	#fixed
	def show
		listing = Listing.find(params[:id])
		listing_offers = []

		if listing.offers != []
			lowest_offer = listing.offers.order(created_at: :desc).first.offer_price
		else
			lowest_offer = 0
		end

		listing_offers = listing.offers.map do |offer|
			if offer.valid
				{
					"offer_id" => offer.id,
					"product_id" => offer.product.id,
					"name" => offer.product.name,
					"image_url" => offer.product.image_url,
					"description" => offer.product.description,
					"condition" => offer.product.condition,
					"created_at" => offer.created_at,
					"offer_price" => offer.offer_price,
					"seller" => offer.user.as_json(:except => [:password_hash])
					}
			end
		end
		listing_offers.compact!

		listing_info = {
			"listing_id" => listing.id,
			"product_id" => listing.product.id,
			"name" => listing.product.name,
			"category" => listing.product.category.name,
			"closed" => listing.closed,
			"image_url" => listing.product.image_url,
			"description" => listing.product.description,
			"condition" => listing.product.condition,
			"created_at" => listing.created_at,
			"expires_at" => listing.expires_at,
			"username" => listing.user.username,
			"max_price" => listing.max_price,
			"accept_price" => listing.accept_price,
			"lowest_offer" => lowest_offer,
			"offers" => listing_offers
		}

		render json: listing_info
	end

	def update
	end


	#fixed
	def destroy
		puts params
		listing = Listing.find(params[:id])
		listing.destroy
		#@user = User.find(params[:user_id]) if params[:user_id]
		# if @user
		# 	@listing = Listing.find(params[:listing_id])
		# 	@listing.destroy
		# else
		# 	render text: "You must be logged in to delete a listing"
		# end
	end

end
