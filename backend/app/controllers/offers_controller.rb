class OffersController < ApplicationController
	#include SendEmailHelper

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
	end

	def accept
		offer = Offer.find(params[:offer_id])
		offer.purchased = true
		offer.save
		listing = Listing.find(offer.listing_id)
		listing.closed = true
		listing.save
		render text: "Offer #{offer.id} has been accepted for listing #{listing.id}"
		p 'listing user', listing.user
		p 'offer user', offer.user
		p 'product name', offer.product.name
		p 'offer', offer
		send_email_buyer(listing.user, offer.user, listing.product, offer)
		send_email_seller(offer.user, listing.user, offer.product, offer)
		#render json: {offer: offer, listing: listing}
	end

	def destroy
		offer = Offer.find(params[:id])
		offer.destroy
	end

	def send_email_buyer(buyer, seller, product, offer)
		args = {}
		args[:subject] = "Congratulations on your purchase!"
		args[:html] = "<div style='text-align:center'><h3>SellMe.io is glad to help you tick one more item of your wishlist!</h3><p>Product: #{product.name}</p><p>Price: #{offer.offer_price}</p><p>Seller's name: #{seller.name}</p><p>Seller's email: #{seller.email}</p></div>"
		args[:name] = buyer.name
		args[:email] = buyer.email
		send_email(args)
	end

	def send_email_seller(seller, buyer, product, offer)
		args = {}
		args[:subject] = "One more item sold!"
		args[:html] = "<div style='text-align:center'><h3>Your offer was accepted! Please contact the buyer to close the deal</h3><p>Product: #{product.name}</p><p>Price: #{offer.offer_price}</p><p>Buyer's name: #{buyer.name}</p><p>Buyer's email: #{buyer.email}</p></div>"
		args[:name] = seller.name
		args[:email] = seller.email
		send_email(args)
	end

	def send_email(args)
		begin
		  mandrill = Mandrill::API.new
		  message = {
		   :subject=> args["subject"],
		   :from_name=> "SellMe.io",
		   :text=>"",
		   :to=>[
		     {
		       :email=> args[:email],
		       :name=> args[:name]
		     }
		     ],
		   :html=> args[:html],
		   :from_email=>"sellme@io.com",
		   :send_at=> "2014-01-01 10:00:00"
		 }
		   sending = mandrill.messages.send message
		   puts sending
		rescue Mandrill::Error => e
			puts "A mandrill error occurred: #{e.class} - #{e.message}"
		end
	end

end
