require_relative '../config/environment'

class Movie < ActiveRecord::Base 
    has_many :rentals 
    has_many :users, through: :rentals 

    
   

    def average_rating 
        #update 
        all_movies = Movie.all.select{|movie|movie.title == self.title}
        ratings = all_movies.map{|movie|movie.blockbuster_rating}
        ratings.inject{|sum,n| sum + n} / ratings.count 
    end 
    
    def avaliable_for_rental?
        
    end 
    
    
    def self.most_watched_movies
        # read 
        titles = self.all.map{|movie|movie.title}
        counts = Hash.new(0)
        titles.each{|title| counts[title] += 1}
        counts.max_by{|k,v|v}[0]
    end 
end 