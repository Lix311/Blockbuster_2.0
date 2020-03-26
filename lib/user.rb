class User < ActiveRecord::Base 
    has_many :rentals 
    has_many :movies, through: :rentals 

    
    # def movie_display
    #     self.movies
    # end 
    
    
    def rate_movie(title)
        movie = self.movies.find_by(:title) # hard 

    end 
    


    def fav_genre
        genres_with_slash = self.movies.map{|movie|movie.genre}
        no_backslash = genres_with_slash.map{|genre|genre.delete("\"")}
        no_left_brac = no_backslash.map{|genre|genre.delete("[")}
        no_right_brac = no_left_brac.map{|genre|genre.delete("]")}
        genre_arrays = no_right_brac.map{|genre|genre.split(",")}
        #iterate thro each genre array and collect how many in hash values
        counts = Hash.new(0)
        genre_arrays.each do |genre_array|
            genre_array.map{|genre| counts[genre.strip] += 1}
               
        end 
        counts.sort_by{|k,v|v}.reverse.first     
    end 

    def self.user_exist?(user_name)
        self.all.find_by(name: user_name) # want this to be false instead its undefined method password 
        # if user == nil 
        #     true  
        # else
        #     false 
        # end  
    end 

    def password_check(pw)
        self.password == pw 
    end 

   
end 