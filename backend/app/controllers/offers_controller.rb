class OffersController < ApplicationController
	def index

	end
	def create
		@user = User.find(params[:user_id])
		@listing = Listing.find(params[:listing_id])
		@offer = @user.offers.create(offer_price: params[:price])
		@product = @offer.create_product(name: params[:name], description: params[:description], image_url: params[:image_url])
		@listing.bids << @offer.create_bid
		@user.products << @product
		@product.save
		@user.save

		render json: {user: @user, offer: @offer, product: @product, listing: @listing}
	end
end
