require_relative '../config/environment'
require 'pry'
require 'rest-client'
require 'json'
binding.pry 

"hello world"

id = RestClient.get("http://www.omdbapi.com/?i=tt3896198&apikey=4a2f124e")
name = RestClient.get("http://www.omdbapi.com/?t=it&apikey=4a2f124e")

thing = JSON.parse(id)
