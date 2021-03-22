class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile
  has_many :orders, through: :profile
  
  enum role: { customer: 0, professional: 10 }
  after_initialize :set_default_role, :if => :new_record?
              
  def set_default_role
    self.role ||= :customer
  end
end
