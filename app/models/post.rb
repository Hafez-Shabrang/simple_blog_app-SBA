class Post < ApplicationRecord
  paginates_per 5
  has_many_attached :images
  validates :title, presence: true, length: {minimum: 4, maximum: 20}
  validates :content, presence: true, length: {minimum: 10}
  belongs_to :user
  has_many :comments, dependent: :destroy
end
