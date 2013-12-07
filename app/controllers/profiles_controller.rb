class ProfilesController < InheritedResources::Base
	
	def index
		@profiles = Profile.all
	end

	def show
		@profile = Profile.find(params[:id])
    @news = Profile.fetch_news(@profile.firstname, @profile.lastname)
	end

end
