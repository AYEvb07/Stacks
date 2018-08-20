class User < ApplicationRecord
<<<<<<< HEAD

#   belongs_to :course  
=======
  
  has_one :dashboard 
   
  belongs_to :course  
  enum role: [:user, :teacher, :admin]
>>>>>>> 3e129fab72a592c17496d76f78bd9ad2182949ea

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  enum role: [:teacher, :student]
    
  after_initialize :set_default_role, :if => :new_record?

  
    
  def set_default_role
    self.role ||= :student
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
<<<<<<< HEAD
#     accepts_nested_attributes_for :course
=======
    accepts_nested_attributes_for :course
    accepts_nested_attributes_for :dashboard
>>>>>>> 3e129fab72a592c17496d76f78bd9ad2182949ea
end
