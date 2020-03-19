class AddNurseId < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :nurse_id, :integer 
  end 
end
