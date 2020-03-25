require_relative '../config/environment'

class Movie < ActiveRecord::Base 
    has_many :rentals 
    has_many :users, through: :rentals 

    
   

    # def highest_rated
    #     #update 
    #     all_movies = Movie.all.select{|movie|movie.title == self.title}
    #     ratings = all_movies.map{|movie|movie.blockbuster_rating}
    #     ratings.inject{|sum,n| sum + n} / ratings.count 
    # end 
    
    # def avaliable_for_rental?
        
    # end 
    
    
    def self.most_watched_movies
        # read 
        prompt = TTY::Prompt.new
        movies = self.all.map{|movie|movie.title}
        counts = Hash.new(0)
        movies.each{|title| counts[title] += 1}
        counts.sort_by{|k,v|v}.reverse[0..2]
        #binding.pry 
    
    end 

    def self.highest_rated_movies 
        prompt = TTY::Prompt.new
        movies = self.all.map{|movie|movie.title}
        ratings = self.all.map{|movie|movie.blockbuster_rating}
        rating_hash = Hash.new(0) 
        movies.each_with_index  do |title,index| 
            rating_hash[title] = ratings[index]
        end  
        rating_hash.sort_by{|k,v|v}.reverse[0..2]
    end 

     
end 