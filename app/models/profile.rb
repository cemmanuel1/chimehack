class Profile < ActiveRecord::Base
  attr_accessible :bio, :facebook, :name, :newsfeed, :personal_site, :quote, :twitter
end
