class CommentsController < ApplicationController
  #include SendEmailHelper

  def index
  end

  def create
    p params
    comment = Comment.new(title: params[:title], content: params[:content], user_id: params[:user_id], listing_id: params[:listing_id], offer_id: params[:offer_id]);
    comment.save
    puts comment.errors.full_messages


    if comment
      render text: "Comment #{comment.id} has been created"
    else
      render text: "Failed to create comments. You are screwed"
    end
  end

  def show_listing_comments
    listing = Listing.find(params[:listing_id])
    render json: listing.comments.to_json
  end

  def show_offer_comments
    offer = Offer.find(params[:offer_id])
    render json: offer.comments.to_json
  end




end
