class Profile < ActiveRecord::Base
  attr_accessible :bio, :facebook, :name, :newsfeed, :personal_site, :quote, :twitter, :firstname, :lastname, :category, :category_id
  belongs_to :user
  belongs_to :category

  def concat_name
    firstname + " " + lastname
  end

  def self.fetch_wiki
    wiki = JSON.parse(RestClient.get('http://en.wikipedia.org/w/api.php', params: {action: 'query', format: "json", prop: "extracts", exintro: true, titles: concat_name } ))

  end

  def self.fetch_bio
  wiki_page_id = wiki["query"]["pages"].first[0]
  bio =  wiki["query"]["pages"][wiki_page_id]["extract"]
  end

  def self.fetch_news
    JSON.parse(RestClient.get('http://content.guardianapis.com/search', params: { q: 'Sandberg',key: 'dk3gqxdpr3g3hsbya3gg8p3h'} ))
  end

end
