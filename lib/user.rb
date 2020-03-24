class User < ActiveRecord::Base 
    has_many :rentals 
    has_many :movies, through: :rentals 

    
    # def movie_display
    #     self.movies
    # end 
    
    
    def rate_movie(title)
        movie = self.movies.find_by(:title) # hard 

    end 
    

    def update_account 
        #update

    end 

    def most_watched_genre_for_user
        #read
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