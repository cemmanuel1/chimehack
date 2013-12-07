require 'wikipedia'

class Profile < ActiveRecord::Base

  attr_accessible :bio, :facebook, :name, :newsfeed, :personal_site, :quote, :twitter, :firstname, :lastname, :category, :category_id, :img, :image
  belongs_to :user
  belongs_to :category
  mount_uploader :image, ImageUploader

  searchable do
    text :firstname
    text :lastname
  end

  def full_name
    firstname + " " + lastname
  end

  def fetch_wiki
    JSON.parse(RestClient.get('http://en.wikipedia.org/w/api.php', params: {action: 'query', format: "json", prop: "extracts", exintro: true, titles: full_name } ))
  end

  def self.make_bio
    profiles = Profile.all
    profiles.each do |profile|
      wiki = profile.fetch_wiki
      wiki_page_id = wiki["query"]["pages"].first[0]
      profile.update_attributes(bio:  wiki["query"]["pages"][wiki_page_id]["extract"])
      profile.save!
    end
  end

  def self.make_image
    profiles = Profile.all
    profiles.each do |profile|
      page = Wikipedia.find( profile.firstname + " " + profile.lastname )
      image = page.image_urls.first
      profile.update_attributes(img: image)
      profile.save!
    end
  end

  def fetch_news
    JSON.parse(RestClient.get('http://content.guardianapis.com/search', params: { q: full_name, key: 'dk3gqxdpr3g3hsbya3gg8p3h'} ))
  end

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = "YST0duS57ja9NGqZ8rzSQ"
      config.consumer_secret     = "cklYumf1nRv9jlhNJrSImD9IlGDXNBHCwMdVSaonink"
      config.access_token        = "72498265-neZHxQUaplTUdigLe4IGbhO8QeSCMQ2qpfVLWYxib"
      config.access_token_secret = "3eI6OPcEiuFhkjWxxVdocjemSIAFMbt1MAxZRNtETpQbm"
    end
  end

  def tweets
    self.class.client.user_timeline(firstname + lastname)
  end

end
