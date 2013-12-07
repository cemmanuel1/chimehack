class ProfilesController < InheritedResources::Base

  def index
    @profiles = Profile.all
    @category = Category.all
  end

  def show
    @profile = Profile.find(params[:id])
    @category = Category.all
  end


end
