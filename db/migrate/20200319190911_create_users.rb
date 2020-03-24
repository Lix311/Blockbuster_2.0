class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :age 
      t.integer :credit_card_number 
      t.string :email
      t.integer :phone_number 
      t.string :password 
    end 
  end
end
