class Doctor < ActiveRecord::Base 
    has_many :patients 
    has_many :hospitals, through: :patients 
    has_many :nurses, through: :patients 
end 