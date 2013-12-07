class Category < ActiveRecord::Base
	attr_accessible :name, :category_id
	belongs_to :profile
end
