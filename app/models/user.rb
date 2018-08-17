class User < ApplicationRecord

  belongs_to :course  
  enum role: [:user, :student, :admin]

  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def set_default_role
    self.role ||= :student
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
