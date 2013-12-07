class ProfilesController < InheritedResources::Base
<<<<<<< HEAD

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    
  end
=======
	
	def index
		@profiles = Profile.all
	end


	def show
		@profile = Profile.find(params[:id])
	end

>>>>>>> f3e2d4c248c87dbd88e70673a3dffbdeb89c7e23

end
