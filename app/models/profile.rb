class Profile < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates_uniqueness_of :user_id
end
