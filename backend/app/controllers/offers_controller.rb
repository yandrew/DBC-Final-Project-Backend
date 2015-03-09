class OffersController < ApplicationController
	def index

	end
	def create
		@user = User.find(params[:user_id])
		@product = @user.products.create(name: params[:name], description: params[:description], image_url: params[:image_url])
		@offer = @user.offers.create(offer_price: params[:price])
		@listing = Listing.find(params[:listing_id])
		@listing << @offer
		@listing.save

		render json: {user: @user, offer: @offer, product: @product, listing: @listing}
	end
end
