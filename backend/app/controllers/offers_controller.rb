class OffersController < ApplicationController
	def index
	end

	def create
		@user = User.find(params[:user_id])
		@product = @user.products.create(name: params[:name], description: params[:description], image_url: params[:image_url])
		@offer = @product.create_offer(offer_price: params[:price])
		@listing = Listing.find(params[:listing_id])
		@listing.offers << @offer
		@offer.save

		render json: {user: @user, offer: @offer, product: @product, listing: @listing}
	end

	def invalidate
		@offer = Offer.find(params[:offer_id])
		@offer.invalid_offer
		@offer.save
	end

	def accept
		@offer = Offer.find(params[:offer_id])
		@offer.purchased = true
		@offer.save
		@listing = Listing.find(@offer.listing_id)
		@listing.closed = true
		@listing.save
		render json: {offer: @offer, listing: @listing}
	end

	def destroy
		@offer = Offer.find(params[:offer_id])
		@offer.destroy
	end
end
