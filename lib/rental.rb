class Rental < ActiveRecord::Base 
    belongs_to :user 
    belongs_to :movie 

    def rental_expired
        #delete 
        return_date = self.rental_start + 3.days 
        no_left = self.movie.genre.delete("]")
        no_both = no_left.delete("[")
        no_all = no_both.delete('"')

        
        if Time.now > return_date
            puts "Rental #{self.movie.title} has expired"
        else 

            puts "You Have #{return_date.day - Time.now.day} Days to Watch #{self.movie.title}"
            puts nil 
            puts "title: #{self.movie.title}"
            puts "genre: #{no_all}"
            puts "overview: #{self.movie.overview}"
            puts "rating: #{self.movie.blockbuster_rating}"
            puts "release_date: #{self.movie.release_date}"
            puts nil 
        end 
    end 

    def movie_display
        rent_check(User.user_exist?())
        #User.user_exist?(user_name).movie_display 
    end 

    
     

     def self.rent_check(current_member_id)
        rental = Rental.all.find_by(id: current_member_id) #use this to search by user_id once rental
        rental.rental_expired 
    
        #Rental.all.select{|rental|rental.user_id == current_member_id}
    #iterate through each rental and puts a string with how many days left 
     end 
#hard 
    
end 