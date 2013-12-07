class CategoriesController < ApplicationController

	# def index
	# 	puts params
	# 	puts "love" * 9
	# 	@profiles = Profile.where(category_id: params[:id])
	# end

	def show
		@category = Category.all
		@profiles = Profile.where(category_id: params[:id])
		# @category = Category.find(params[:id])
	end

end