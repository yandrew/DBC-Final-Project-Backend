class ProductsController < ApplicationController
	def index
		@products = Product.all
		render json: @products
	end

	def show
		@product = Product.find(params[:id])
		render json: @product
	end

	def create
		@product = Product.create(name: params[:name], image_url: params[:image_url], description: params[:description], condition: params[:condition], user_id: params[:user_id], category_id: params[:category_id])
		render json: @product
	end
end
