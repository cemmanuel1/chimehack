class Profile < ActiveRecord::Base

  attr_accessible :bio, :facebook, :name, :newsfeed, :personal_site, :quote, :twitter, :firstname, :lastname, :category, :category_id
  belongs_to :user
  belongs_to :category


  def concat_name(firstname,lastname)
    firstname + " " + lastname
  end

  def fetch_wiki(firstname, lastname)
    JSON.parse(RestClient.get('http://en.wikipedia.org/w/api.php', params: {action: 'query', format: "json", prop: "extracts", exintro: true, titles: firstname + " " + lastname} ))
  end

  def self.make_bio
    profiles = Profile.all
    profiles.each do |profile|
      wiki = profile.fetch_wiki(profile.firstname, profile.lastname)
      wiki_page_id = wiki["query"]["pages"].first[0]
      profile.update_attributes(bio:  wiki["query"]["pages"][wiki_page_id]["extract"])
      profile.save!
    end
  end

  def self.fetch_news(firstname,lastname)
    JSON.parse(RestClient.get('http://content.guardianapis.com/search', params: { q: firstname + " " + lastname, key: 'dk3gqxdpr3g3hsbya3gg8p3h'} ))
  end

end
