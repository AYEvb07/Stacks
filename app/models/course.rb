class Course < ApplicationRecord
#     has_many :users 
    belongs_to :teachers
    belongs_to :dashboard
    
#     accepts_nested_attributes_for :users
end
