class ProfilesController < InheritedResources::Base

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    
  end

end
