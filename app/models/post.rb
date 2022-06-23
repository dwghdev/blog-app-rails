class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :body, presence: true
  has_many :comments, dependent: :destroy
end
