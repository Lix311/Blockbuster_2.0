class Nurse < ActiveRecord::Base 
    belongs_to :hospital 
    has_many :patients 
    has_many :doctors, through: :patients  
end 