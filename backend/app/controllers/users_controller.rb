class UsersController < ApplicationController
	def index
	end

	def login
		@user = User.find_by(username: params[:username])
    if @user.password == params[:password]
			render json: {id: @user.id}
		else
			render(:file => File.join(Rails.root, 'public/404.html'), :status => 403, :layout => false)
		end
	end

	def show
		@user = User.find(params[:id])
		if @user
			render :json => { :user => @user.as_json(:except => [:password_hash])}
		else
			render(:file => File.join(Rails.root, 'public/404.html'), :status => 403, :layout => false)
		end
	end

	def create
		@user = User.create(username: params[:username], password_hash: params[:password_hash], name: params[:name], email: params[:email], avatar: params[:avatar], bio: params[:bio])
		render json: @user
	end

	def listings
		@user = User.find(params[:user_id])
		listings = @user.listings
		@listings = []
		listings.map do |listing|
			@offers = []
			listing.offers.order(created_at: :desc).map do |offer|
				@offer = {
					"product_id" => offer.product.id,
					"name" => offer.product.name,
					"image_url" => offer.product.image_url,
					"description" => offer.product.description,
					"condition" => offer.product.condition,
					"created_at" => offer.created_at,
					"offer_price" => offer.offer_price,
					"seller" => offer.user
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
				"lowest_offer" => listing.offers.order(created_at: :desc).first.offer_price,
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

			@listing = Listing.find(offer.listing_id)
			listing = {
			"listing_id" => @listing.id,
			"product_id" => @listing.product.id,
			"name" => @listing.product.name,
			"category" => @listing.product.category.name,
			"image_url" => @listing.product.image_url,
			"description" => @listing.product.description,
			"condition" => @listing.product.condition,
			"created_at" => @listing.created_at,
			"expires_at" => @listing.expires_at,
			"username" => @listing.user.username,
			"max_price" => @listing.max_price,
			"accept_price" => @listing.accept_price,
			"lowest_offer" => @listing.offers.order(created_at: :desc).first.offer_price,
			"your_offer" => offer.offer_price,
			"valid_offer" => offer.valid
			}
			@listings << listing
		end
		render json: @listings
	end


		
end
