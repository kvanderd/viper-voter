# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

20.times do 
	User.create(username: Faker::Name.name, password: "passwordlove", password_confirmation: "passwordlove")
end

20.times do
	Change.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, user_id: (1..20).to_a.sample)
end

350.times do
	Vote.create(upvote: true, change_id: (1..20).to_a.sample) 
end 

50.times do
	Vote.create( upvote: false, change_id: (1..20).to_a.sample ) 
end


# require 'net/http'
# require "uri"
# require "csv"

# # seed the state file through csv
# CSV.foreach("state_data.csv", headers: true) do |row|
# 	State.create(name: row.field('name'), abbreviation: row.field('abbreviation') )
# end
# states = State.all
# creates cities and associates their states
# CSV.foreach("cities.csv", headers: true) do |row|
# 	state_id = State.where(abbreviation: row.field('state')).first.id
#   City.create(name: row.field('city'), zip: row.field("zip"), state_id: state_id )
# end

# #seed the senates through sunlight api

# ENDPOINT = "http://congress.api.sunlightfoundation.com/"
# uri = URI.parse(ENDPOINT)
# @http = Net::HTTP.new(uri.host, uri.port)

# states.each do |state|
# 	kiss = Net::HTTP::Get.new("#{ENDPOINT}" + "legislators?title=Sen&state="+"#{state.abbreviation}"+"&apikey=04d4263ede11465b890b1f8ff95811e1")
# 	love = @http.request(kiss)
# 	JSON.parse(love.body)["results"].each do |hash|
# 		 JSON.parse(love.body)["count"].to_i.times do
# 			Senate.create(state_id: state.id, 
# 			              first_name: hash["first_name"], 
# 			              last_name: hash["last_name"],
# 			              twiter: hash["twitter_id"],
# 			              facebook: hash["facebook_id"],
# 			              contact: hash["contact_form"],
# 			              phone: hash["phone"],
# 			              party: hash["party"],
# 			              gender: hash["gender"],
# 			              in_office: hash["in_office"],
# 			              term_end: hash["term_end"],
# 			              term_start: hash["term_start"])
# 	 end
# 	end
# end

# #seed the house through sunlight api
# states.each do |state|
# 	kiss = Net::HTTP::Get.new("#{ENDPOINT}" + "legislators?chamber=house&state="+"#{state.abbreviation}"+"&apikey=04d4263ede11465b890b1f8ff95811e1")
# 	love = @http.request(kiss)
# 	JSON.parse(love.body)["results"].each do |hash|
# 		 JSON.parse(love.body)["count"].to_i.times do
# 			House.create(state_id: state.id, 
# 			              first_name: hash["first_name"], 
# 			              last_name: hash["last_name"],
# 			              twiter: hash["twitter_id"],
# 			              facebook: hash["facebook_id"],
# 			              contact: hash["contact_form"],
# 			              phone: hash["phone"],
# 			              party: hash["party"],
# 			              gender: hash["gender"],
# 			              in_office: hash["in_office"],
# 			              term_end: hash["term_end"],
# 			              term_start: hash["term_start"])
# 	 end
# 	end
# end


# GET IMAGES FROM WIKIPEDIA


# http://en.wikipedia.org/w/api.php?action=query&titles=Al-Farabi&prop=pageimages&format=json&pithumbsize=100

# get all senate and house members. Loop through their names and grab images. Process the images through the picture_processeror
# and save them to images with foreign key of the members.


# Alabama

# http://www.dumblaws.com/law/1554





