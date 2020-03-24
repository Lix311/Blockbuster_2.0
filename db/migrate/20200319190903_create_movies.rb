class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre 
      t.string :overview
      t.integer :blockbuster_rating
      t.date :release_date 
    end 
  end
end
