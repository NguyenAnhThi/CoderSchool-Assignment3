class User < ApplicationRecord
  has_secure_password
  has_many :events, foreign_key: 'creater_id'

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end