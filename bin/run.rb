require_relative '../config/environment'
require 'pry'
require 'rest-client'
require 'json'



# "hello world"

# id = RestClient.get("http://www.omdbapi.com/?i=tt3896198&apikey=4a2f124e")
# name = RestClient.get("http://www.omdbapi.com/?t=it&apikey=4a2f124e")

# thing = JSON.parse(id)
def banner 
    box = TTY::Box.frame(width:65, height:10, border: :thick, align: :left) do 
        "
        ___ _         _   _            _          ___   __  
       | _ ) |___  __| |_| |__ _  _ __| |_ ___ _ |_  ) /  \\
       | _ \\ / _ \\/ _| / / '_ \\ || (_-<  _/ -_) '_/ / | () |
       |___/_\\___/\\__|_\\_\\_.__/\\_,_/__/\\__\\___|_|/\___(_)__/
    
    "end 
       
       print box 
       
end 




def run_application 
    prompt = TTY::Prompt.new
    system("clear")
    banner
    main_log_in = prompt.select("Welcome to Blockbuster 2.0") do |log_in|
        log_in.choice 'Create Account'
        log_in.choice 'Sign-In'
     end 
    
     
    if main_log_in == 'Create Account'
        while true 
        
        b_username = prompt.ask("Please Enter Username")
        if User.user_exist?(b_username) == nil 
        
            b_age = prompt.ask("Please Enter Age")
            b_credit_card = prompt.ask("Please Enter Credit Card Number")
            b_email = prompt.ask("Please Enter Email")
            b_phonenum = prompt.ask("Please Enter Phone Number")
            b_password = prompt.mask("Please Enter Password")

            User.create(name: b_username, age: b_age, credit_card_number: b_credit_card, email: b_email, phone_number: b_phonenum,password: b_password)
            exit 
        end  
            puts "That Username is Already Taken. Please Try Another Name"
            exit 
        end 


    
    elsif main_log_in == 'Sign-In' 
        system("clear")
     
        user_name = prompt.ask("Please Enter Username")
        password = prompt.mask("Please Enter Password")
     
        if User.user_exist?(user_name) == nil
            puts "Account Does Dot Exist."
            puts "Please Try Again" 
            exit 
        elsif User.user_exist?(user_name).password_check(password) == false 
            puts "Wrong Password or Username, Try Again"
            exit 
        end 
         
 
    end 
 

        
        while true
    main_menu = prompt.select("Welcome #{user_name}, Please Choose a Menu Option.") do |menu|
        menu.choice 'Rent_Movie'
        menu.choice 'My_Movies'
        menu.choice 'Settings'
        menu.choice 'Exit'
    end 

    if main_menu == 'Rent_Movie'
        system("clear")
        puts "Find Movie By ?"
        rent_menu = prompt.select("#{user_name}, Please Choose a Search Option.") do |rent_menu|
            rent_menu.choice 'By Blockbuster 2.0 Popular List'
            rent_menu.choice 'By Title'
            rent_menu.choice 'By Genre'
            rent_menu.choice 'By Blockbuster 2.0 Recommendation for You'
            rent_menu.choice 'By Blockbuster 2.0 Rating'
        end 

        if rent_menu == 'By Blockbuster 2.0 Popular List'
            top_3 = Movie.all.most_watched_movies
            top_3.each do |movie|
                title_info = movie[0]
                
                rec_search = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=c73ff9db1c1c1d2942d1ad8f49bfba66&language=en-US&query={#{title_info}}&page=1&include_adult=false")
                movie_data = JSON.parse(rec_search)["results"]
                
                    title_info = movie_data[0]["title"]
                    overview_info = movie_data[0]["overview"] 
                    rating_info = movie_data[0]["vote_average"]
                    release_date_info = movie_data[0]["release_date"]
                    genre_info = movie_data[0]["genre_ids"].map do |genre|
                        if genre == 28
                            "Action"
                        elsif genre == 12
                            "Adventure"
                        elsif genre == 16
                            "Animation"
                        elsif genre == 35
                            "Comedy"
                        elsif genre == 80
                            "Crime"
                        elsif genre == 99
                            "Documentary"
                        elsif genre == 18
                            "Drama"
                        elsif genre == 10751
                            "Family"
                        elsif genre == 14
                            "Fantasy"
                        elsif genre == 36
                            "History"
                        elsif genre == 27
                            "Horror"
                        elsif genre == 10402
                            "Music"
                        elsif genre == 9648
                            "Mystery"
                        elsif genre == 10749
                            "Romance"
                        elsif genre == 878
                            "Science Fiction"
                        elsif genre == 10770
                            "TV Movie"
                        elsif genre == 53
                            "Thriller"
                        elsif genre == 10752
                            "War"
                        elsif genre == 37
                            "Western"
                        end 
                    
                    end 
                 
                    system("clear")
                    puts title_info
                    puts overview_info
                 
                    if prompt.yes?('Rent This Movie?')
                        Movie.create(title: title_info,genre: genre_info,overview: overview_info,blockbuster_rating: rating_info,release_date: release_date_info)
                        Rental.create(user_id: User.user_exist?(user_name).id, movie_id: Movie.last.id,rental_start: Time.new)
                        system("clear")
                        puts "Movie was Rented"
                        puts "You will have 3 days to watch #{title_info}"
                        break  
                    end 
                 system("clear")
            end 
             
             
        elsif rent_menu == 'By Title'
            movie_title = prompt.ask("Please Enter Title of Movie")
            
             
            
                
            rec_search = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=c73ff9db1c1c1d2942d1ad8f49bfba66&language=en-US&query={#{movie_title}}&page=1&include_adult=false")
                movie_data = JSON.parse(rec_search)["results"]
                
            
            
                movie_data.each_with_index do |movie,index|
                    title_info = movie_data[index]["title"]
                    overview_info = movie_data[index]["overview"] 
                    rating_info = movie_data[index]["vote_average"]
                    release_date_info = movie_data[index]["release_date"]

                    genre_info = movie_data[index]["genre_ids"].map do |genre|
                        if genre == 28
                            "Action"
                        elsif genre == 12
                            "Adventure"
                        elsif genre == 16
                            "Animation"
                        elsif genre == 35
                            "Comedy"
                        elsif genre == 80
                            "Crime"
                        elsif genre == 99
                            "Documentary"
                        elsif genre == 18
                            "Drama"
                        elsif genre == 10751
                            "Family"
                        elsif genre == 14
                            "Fantasy"
                        elsif genre == 36
                            "History"
                        elsif genre == 27
                            "Horror"
                        elsif genre == 10402
                            "Music"
                        elsif genre == 9648
                            "Mystery"
                        elsif genre == 10749
                            "Romance"
                        elsif genre == 878
                            "Science Fiction"
                        elsif genre == 10770
                            "TV Movie"
                        elsif genre == 53
                            "Thriller"
                        elsif genre == 10752
                            "War"
                        elsif genre == 37
                            "Western"
                        end 
                    
                    end 


                    system("clear")
                    puts title_info
                    puts overview_info

                    if prompt.yes?('Rent This Movie?')
                        Movie.create(title: title_info,genre: genre_info,overview: overview_info,blockbuster_rating: rating_info,release_date: release_date_info)
                        Rental.create(user_id: User.user_exist?(user_name).id, movie_id: Movie.last.id,rental_start: Time.new)
                        system("clear")
                        puts "Movie was Rented"
                        puts "You will have 3 days to watch #{title_info}"
                        break 
                    end 
                
                    
                    system("clear")
                end 
            

            
            


        elsif rent_menu == 'By Genre'
            
        genre_array = prompt.multi_select("#{user_name}, Please Choose One or More Genres.") do |genre_menu|
            genre_menu.choice Action: 28
            genre_menu.choice Adventure: 12
            genre_menu.choice Animation: 16
            genre_menu.choice Comedy: 35
            genre_menu.choice Crime: 80
            genre_menu.choice Documentary: 99
            genre_menu.choice Drama: 18
            genre_menu.choice Family: 10751
            genre_menu.choice Fantasy: 14
            genre_menu.choice History: 36
            genre_menu.choice Horror: 27
            genre_menu.choice Music: 10402
            genre_menu.choice Mystery: 9648
            genre_menu.choice Romance: 10749
            genre_menu.choice Science_Fiction: 878
            genre_menu.choice TV_Movie: 10770
            genre_menu.choice Thriller: 53
            genre_menu.choice War: 10752
            genre_menu.choice Western: 37
            
        end 
            
        genre_nums = genre_array.to_s.remove("]").remove("[")
        rec_search = RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=c73ff9db1c1c1d2942d1ad8f49bfba66&with_genres=#{genre_nums}&sort_by=vote_average.desc&vote_count.gte=10&language=en-US&page=1")
        movie_data = JSON.parse(rec_search)["results"]

        movie_data.each_with_index do |movie,index|
            title_info = movie_data[index]["title"]
            overview_info = movie_data[index]["overview"] 
            rating_info = movie_data[index]["vote_average"]
            release_date_info = movie_data[index]["release_date"]

            genre_info = movie_data[index]["genre_ids"].map do |genre|
                if genre == 28
                    "Action"
                elsif genre == 12
                    "Adventure"
                elsif genre == 16
                    "Animation"
                elsif genre == 35
                    "Comedy"
                elsif genre == 80
                    "Crime"
                elsif genre == 99
                    "Documentary"
                elsif genre == 18
                    "Drama"
                elsif genre == 10751
                    "Family"
                elsif genre == 14
                    "Fantasy"
                elsif genre == 36
                    "History"
                elsif genre == 27
                    "Horror"
                elsif genre == 10402
                    "Music"
                elsif genre == 9648
                    "Mystery"
                elsif genre == 10749
                    "Romance"
                elsif genre == 878
                    "Science Fiction"
                elsif genre == 10770
                    "TV Movie"
                elsif genre == 53
                    "Thriller"
                elsif genre == 10752
                    "War"
                elsif genre == 37
                    "Western"
                end 
                
            end 


            system("clear")
            puts title_info
            puts overview_info

            if prompt.yes?('Rent This Movie?')
                Movie.create(title: title_info,genre: genre_info,overview: overview_info,blockbuster_rating: rating_info,release_date: release_date_info)
                Rental.create(user_id: User.user_exist?(user_name).id, movie_id: Movie.last.id,rental_start: Time.new)
                system("clear")
                puts "Movie was Rented"
                puts "You have 3 days to watch #{title_info}"
                Movie.find_by(title: title_info)
                break
            end 
        system("clear")
        end 

        
        elsif rent_menu == 'By Blockbuster 2.0 Recommendation for You'
            

            top_genre = User.user_exist?(user_name).fav_genre
            if top_genre == nil 
                puts "We Dont Know Your Interests"
                puts "Please Rent More Movies Before We Make Recommendations"
                exit 
            end 
            
            genre = top_genre[0]
                
                if genre == "Action"
                    genre_id = 28 
                elsif genre == "Adventure"
                    genre_id = 12
                elsif genre == "Animation"
                    genre_id = 16
                elsif genre == "Comedy"
                    genre_id = 35
                elsif genre == "Crime"
                    genre_id = 80
                elsif genre == "Documentary"
                    genre_id = 99
                elsif genre == "Drama"
                    genre_id = 18
                elsif genre == "Family"
                    genre_id = 10751
                elsif genre == "Fantasy"
                    genre_id = 14
                elsif genre == "History"
                    genre_id = 36
                elsif genre == "Horror"
                    genre_id = 27
                elsif genre == "Music"
                    genre_id = 10402
                elsif genre == "Mystery"
                    genre_id = 9648
                elsif genre == "Romance"
                    genre_id = 10749
                elsif genre == "Science Fiction"
                    genre_id = 878
                elsif genre == "TV Movie"
                    genre_id = 10770
                elsif genre == "Thriller"
                    genre_id = 53
                elsif genre == "War"
                    genre_id = 10752
                elsif genre == "Western"
                    genre_id = 37
                end 
                    
                
                rec_search = RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=c73ff9db1c1c1d2942d1ad8f49bfba66&with_genres=#{genre_id}&sort_by=vote_average.desc&vote_count.gte=10&language=en-US&page=1")
                movie_data = JSON.parse(rec_search)["results"]
                
                movie_data.each_with_index do |movie,index|
                    title_info = movie_data[index]["title"]
                    overview_info = movie_data[index]["overview"] 
                    rating_info = movie_data[index]["vote_average"]
                    release_date_info = movie_data[index]["release_date"]
                    
                    genre_info = movie_data[index]["genre_ids"].map do |genre|
                        if genre == 28
                            "Action"
                        elsif genre == 12
                            "Adventure"
                        elsif genre == 16
                            "Animation"
                        elsif genre == 35
                            "Comedy"
                        elsif genre == 80
                            "Crime"
                        elsif genre == 99
                            "Documentary"
                        elsif genre == 18
                            "Drama"
                        elsif genre == 10751
                            "Family"
                        elsif genre == 14
                            "Fantasy"
                        elsif genre == 36
                            "History"
                        elsif genre == 27
                            "Horror"
                        elsif genre == 10402
                            "Music"
                        elsif genre == 9648
                            "Mystery"
                        elsif genre == 10749
                            "Romance"
                        elsif genre == 878
                            "Science Fiction"
                        elsif genre == 10770
                            "TV Movie"
                        elsif genre == 53
                            "Thriller"
                        elsif genre == 10752
                            "War"
                        elsif genre == 37
                            "Western"
                        end 
                    
                    end 
                 
                    system("clear")
                    puts title_info
                    puts overview_info
                 
                    if prompt.yes?('Rent This Movie?')
                        Movie.create(title: title_info,genre: genre_info,overview: overview_info,blockbuster_rating: rating_info,release_date: release_date_info)
                        Rental.create(user_id: User.user_exist?(user_name).id, movie_id: Movie.last.id,rental_start: Time.new)
                        system("clear")
                        puts "Movie was Rented"
                        puts "You will have 3 days to watch #{title_info}"
                        break 
                    end 
                system("clear")
                end 
                 
            
             

        elsif rent_menu == 'By Blockbuster 2.0 Rating'
          top_3 = Movie.all.highest_rated_movies
            top_3.each do |movie|
                title_info = movie[0]
                overview_info = movie[1]
                rec_search = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=c73ff9db1c1c1d2942d1ad8f49bfba66&language=en-US&query={#{title_info}}&page=1&include_adult=false")
                movie_data = JSON.parse(rec_search)["results"]
                
                    title_info = movie_data[0]["title"]
                    overview_info = movie_data[0]["overview"] 
                    rating_info = movie_data[0]["vote_average"]
                    release_date_info = movie_data[0]["release_date"]
                    genre_info = movie_data[0]["genre_ids"].map do |genre|
                        if genre == 28
                            "Action"
                        elsif genre == 12
                            "Adventure"
                        elsif genre == 16
                            "Animation"
                        elsif genre == 35
                            "Comedy"
                        elsif genre == 80
                            "Crime"
                        elsif genre == 99
                            "Documentary"
                        elsif genre == 18
                            "Drama"
                        elsif genre == 10751
                            "Family"
                        elsif genre == 14
                            "Fantasy"
                        elsif genre == 36
                            "History"
                        elsif genre == 27
                            "Horror"
                        elsif genre == 10402
                            "Music"
                        elsif genre == 9648
                            "Mystery"
                        elsif genre == 10749
                            "Romance"
                        elsif genre == 878
                            "Science Fiction"
                        elsif genre == 10770
                            "TV Movie"
                        elsif genre == 53
                            "Thriller"
                        elsif genre == 10752
                            "War"
                        elsif genre == 37
                            "Western"
                        end 
                    
                    end 
                 
                    system("clear")
                    puts title_info
                    puts overview_info
                 
                    if prompt.yes?('Rent This Movie?')
                        Movie.create(title: title_info,genre: genre_info,overview: overview_info,blockbuster_rating: rating_info,release_date: release_date_info)
                        Rental.create(user_id: User.user_exist?(user_name).id, movie_id: Movie.last.id,rental_start: Time.new)
                        system("clear")
                        puts "Movie was Rented"
                        puts "You will have 3 days to watch #{title_info}"
                        break
                    end 
                 
            end 
            system("clear")
        end 
         
    
    
    
    
    
    
    
    
    
    
    
    elsif main_menu == 'Settings'
        settings_menu = prompt.select("#{user_name}, Please Choose an Option.") do |set_menu|
            set_menu.choice 'Update_Account_Information'
            set_menu.choice 'Cancel_Account'
            set_menu.choice 'Exit'
        end 

        
        if settings_menu == 'Update_Account_Information'
                
                User.user_exist?(user_name).update(age: prompt.ask("Please Enter Age"))
                User.user_exist?(user_name).update(credit_card_number: prompt.ask("Please Enter Credit Card Number"))
                User.user_exist?(user_name).update(email: prompt.ask("Please Enter Email"))
                User.user_exist?(user_name).update(phone_number: prompt.ask("Please Enter Phone Number"))
                User.user_exist?(user_name).update(password: prompt.mask("Please Enter Password"))
            puts "Account has been updated"
            puts "Please Log-In Again"
            system("clear")
            exit   
    
        elsif settings_menu == "Cancel_Account"
            if prompt.yes?('Are You Sure You Want to Delete This Account?')
                
                User.user_exist?(user_name).delete 
                exit 
            end 
        elsif settings_menu == 'Exit'
            system("clear")
            exit 
           
        end 
    
    elsif main_menu == "My_Movies"
        user = User.user_exist?(user_name)
        user_rentals = Rental.all.where(user_id: user.id)
        user_rentals.each do |rental|
            rental.rental_expired #this is returning instances and not putsing out anything
        end 
    
        
    elsif main_menu == 'Exit'
        exit 
    end 

   
   
   
   
   
   
   
   
    

    



end 
end 

run_application

