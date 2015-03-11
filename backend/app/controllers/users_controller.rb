class UsersController < ApplicationController
	def index
		render(:file => File.join(Rails.root, 'public/api_docs.html'), :status => 200, :layout => false)
	end

	def login
		puts "on login route"
		@user = User.find_by(username: params[:username]) if params[:username]
		@user = User.find_by(email: params[:email]) if params[:email]
    if @user.password == params[:password]
			render json: {id: @user.id}
		else
			render(:file => File.join(Rails.root, 'public/404.html'), :status => 403, :layout => false)
		end
	end

	#fixed
	def show
		@user = User.find(params[:id])
		if @user
			render :json => { :user => @user.as_json(:except => [:password_hash])}
		else
			render(:file => File.join(Rails.root, 'public/404.html'), :status => 403, :layout => false)
		end
	end

	#fixed
	def create
		@user = User.create(username: params[:username], password: params[:password], name: params[:name], email: params[:email], avatar: params[:avatar], bio: params[:bio])
		puts "User created with success #{@user.id}"
		render json: @user.as_json(:except => [:password_hash])
	end

	#fixed
	def destroy
		puts params
		@user = User.find(params[:id])
		if @user.destroy
			puts "User destroyed with sucess"
		end
	end


	def listings
		user = User.find(params[:user_id]) if params[:user_id]

		#return all the listing
		#each listing should have an array with all the offers

			if user
			listings = user.listings
			listings_to_send = []
				listings.map do |listing|
					offers = []
					#check if there any offers
					if listing.offers != []
						listing.offers.order(created_at: :desc).map do |offer|
							offer = {
								"product_id" => offer.product.id,
								"name" => offer.product.name,
								"image_url" => offer.product.image_url,
								"description" => offer.product.description,
								"condition" => offer.product.condition,
								"created_at" => offer.created_at,
								"offer_price" => offer.offer_price,
								"seller" => offer.user.as_json(:except => [:password_hash])
								}
							offers << offer
						end
						lowest_offer = listing.offers.order(created_at: :desc).first.offer_price
					end
					lowest_offer = 0 unless lowest_offer
					listing_to_send = {
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
						"lowest_offer" => lowest_offer,
						"offers" => offers
						}
					listings_to_send << listing_to_send
				end
				p "printing listings" ,listings_to_send
				render json: listings_to_send
		else
			render(:file => File.join(Rails.root, 'public/404.html'), :status => 403, :layout => false)
		end
	end

	def offers
		puts params
		user = User.find(params[:user_id]) if params[:user_id]
		offers_to_send = []
		if user
			offers = user.offers
			listings = []
			offers.each do |offer|
				offer_to_send = offer.as_json
				offer_to_send["product"] = offer.product.as_json
				offer_to_send["listing"] = offer.listing.as_json
				offers_to_send << offer_to_send
			end
			p "in offers"
			p offers_to_send.to_json
			render json: offers_to_send.to_json
		else
			render(:file => File.join(Rails.root, 'public/404.html'), :status => 403, :layout => false)
		end
	end
		
end
