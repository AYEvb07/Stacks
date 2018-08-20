class Course < ApplicationRecord
<<<<<<< HEAD
#     has_many :users 
=======
    has_many :users 
    belongs_to :teachers
    belongs_to :dashboard
>>>>>>> 3e129fab72a592c17496d76f78bd9ad2182949ea
    
#     accepts_nested_attributes_for :users
end
