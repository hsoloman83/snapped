class User < ApplicationRecord
  has_many :pictures
  has_many :comments
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :email, presence: true
  has_secure_password
end
