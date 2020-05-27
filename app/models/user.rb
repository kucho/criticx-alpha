class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  validates :username, :email, presence: true, uniqueness: true
  validates :birth_date, presence: true, older_than_sixteen: true
end
