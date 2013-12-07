class ProfilesController < InheritedResources::Base


  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @news = Profile.fetch_news(@profile.firstname, @profile.lastname)
  end

  def new
  	@profile = Profile.new
  	puts params
  	puts "love" * 29
  end

  def create
    @profile = Profile.create(params[:profile])
    @profile.user_id = session[:user_id]
    redirect_to profile_path(@profile.id)
  end


end
