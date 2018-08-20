class User < ApplicationRecord

  belongs_to :course  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  enum role: [:teacher, :student]
    
  after_initialize :set_default_role, :if => :new_record?

  
    
  def set_default_role
    self.role ||= :student
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    accepts_nested_attributes_for :course
end
