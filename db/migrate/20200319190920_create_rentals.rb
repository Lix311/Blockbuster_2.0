class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.integer :user_id 
      t.integer :movie_id 
      t.date_time :rental_start
    end 
  end
end
