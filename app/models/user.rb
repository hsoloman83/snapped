class User < ApplicationRecord
  has_many :pictures
  has_many :comments
  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, presence: true
  has_secure_password

  def received_comments
    self.pictures.map do |pic|
      pic.comments
    end
  end

end
