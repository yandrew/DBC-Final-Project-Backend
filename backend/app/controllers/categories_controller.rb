class CategoriesController < ApplicationController
	def index
		@categories = Category.all.order(name: :asc)
		render json: @categories
	end
end
