class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.integer :doctor_id 
      t.integer :hospital_id 
    end 
  end
end
