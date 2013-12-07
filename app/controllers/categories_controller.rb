class CategoriesController < ApplicationController

	def show
		@profiles = Profile.where(category_id: params[:id])
		# @category = Category.find(params[:id])
	end

end