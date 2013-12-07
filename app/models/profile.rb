class Profile < ActiveRecord::Base

  attr_accessible :bio, :facebook, :name, :newsfeed, :personal_site, :quote, :twitter, :firstname, :lastname
  belongs_to :user
  belongs_to :category

  def self.fetch_news
    JSON.parse(RestClient.get('http://content.guardianapis.com/search', params: { q: 'Sandberg',key: 'dk3gqxdpr3g3hsbya3gg8p3h'} ))
  end

end
