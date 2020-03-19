class Patient < ActiveRecord::Base 
    belongs_to :doctor 
    belongs_to :hospital 
    belongs_to :nurse 
end 