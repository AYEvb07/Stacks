class Course < ApplicationRecord
    has_many :users 
    belongs_to :teachers
    
    accepts_nested_attributes_for :users
end
