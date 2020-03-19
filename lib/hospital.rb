class Hospital < ActiveRecord::Base 
    has_many :patients 
    has_many :doctors, through: :patients 
    has_many :nurses 
end 