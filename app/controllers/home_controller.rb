class HomeController < ApplicationController

	def index
		@category = Category.all
	end

end