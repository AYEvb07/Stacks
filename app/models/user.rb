class User < ApplicationRecord
  
  has_one :dashboard
   
#   belongs_to :course  
  enum role: [:user, :teacher, :admin]

  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
#     accepts_nested_attributes_for :course
    accepts_nested_attributes_for :dashboard
end
