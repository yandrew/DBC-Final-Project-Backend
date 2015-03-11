class OffersController < ApplicationController
	def index
	end

	def create
		p params
		offer = Offer.new(offer_price: params[:price], user_id: params[:user_id], listing_id: params[:listing_id], rating_id: 1);
		offer.save
		puts offer.errors.full_messages
		product = Product.create(name: params[:name], description: params[:description], condition: params[:condition], image_url: params[:image_url], user_id: params[:user_id], offer_id: offer.id)

		if product && offer
			render text: "Offer #{offer.id} and product #{product.id} have been created"
		elsif product
			render text: "Failed to create offer"
		elsif offer
			render text: "Failed to create product"
		else
			render text: "Failed to create offer and product. You are screwed"
		end

		# @user = User.find(params[:user_id]) if params[:user_id]
		# if @user
		# 	@product = @user.products.create(name: params[:name], description: params[:description], image_url: params[:image_url])
		# 	@offer = @product.create_offer(offer_price: params[:price])
		# 	@listing = Listing.find(params[:listing_id])
		# 	@listing.offers << @offer
		# 	@offer.save
		# 	render json: {user: @user, offer: @offer, product: @product, listing: @listing}
		# else
		# 	render(:file => File.join(Rails.root, 'public/404.html'), :status => 403, :layout => false)
		# end
	end

	# def invalidate
	# 	@offer = Offer.find(params[:offer_id])
	# 	@offer.invalid_offer
	# 	@offer.save
	# end

	# def accept
	# 	@offer = Offer.find(params[:offer_id])
	# 	@offer.purchased = true
	# 	@offer.save
	# 	@listing = Listing.find(@offer.listing_id)
	# 	@listing.closed = true
	# 	@listing.save
	# 	render json: {offer: @offer, listing: @listing}
	# end

	def destroy
		offer = Offer.find(params[:id])
		offer.destroy
	end

end
