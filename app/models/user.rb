class User < ApplicationRecord

  
  has_one :dashboard 
   
  belongs_to :course  
  enum role: [:user, :teacher, :admin]


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  enum role: [:teacher, :student]
    
  after_initialize :set_default_role, :if => :new_record?

  
    
  def set_default_role
    self.role ||= :student
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    

  
end
