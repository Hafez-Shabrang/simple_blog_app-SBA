class User < ApplicationRecord
  paginates_per 5
  include Gravtastic
  gravtastic
  has_secure_password
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {minimum: 3, maximum: 15}
  validates :email, presence: true, length: {minimum: 12, maximum: 30}, uniqueness: true
  has_many :posts
  has_many :comments
end
