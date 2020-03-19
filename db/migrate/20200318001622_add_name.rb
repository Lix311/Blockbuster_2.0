class AddName < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :name, :string  
  end
end
