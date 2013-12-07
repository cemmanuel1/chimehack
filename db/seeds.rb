# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Category.create(name: "STEM")
Category.create(name: "Non-profit")
Category.create(name: "Activist")
Category.create(name: "Health")
Category.create(name: "Government")
Category.create(name: "Trailblazer")
Category.create(name: "Media")

CSV.foreach("women.csv", headers: true) do |row|
	Profile.create(firstname: row.field("first_name"), lastname: row.field("last_name"), category_id: row.field("category_id") )
end
 

