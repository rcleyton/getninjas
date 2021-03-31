class Profile < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates_uniqueness_of :user_id
  validates :name, :phone, :city, :neighborhood, 
            :street, :zip_code, :state, presence: true
end
