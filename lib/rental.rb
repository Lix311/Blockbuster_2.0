class Rental < ActiveRecord::Base 
    belongs_to :user 
    belongs_to :movie 

    def rental_expired
        #delete 
        return_date = self.rental_start + 3.days 
        if return_date < Time.now 
            self.delete 
        else 
           puts "You have #{return_date.day - Time.now.day} days to watch #{self.movie.title}"
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