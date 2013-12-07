class ProfilesController < InheritedResources::Base


  def index
  @search = Sunspot.search(Profile) do
      fulltext params[:search]
    end
    @profiles = @search.results
    # @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @news = @profile.fetch_news
    # @twitter = Profile.fetch_tweets
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
