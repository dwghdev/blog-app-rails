class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, through: :user, dependent: :destroy
  has_one :content, 
    class_name: "ActionText::RichText", 
    as: :record, 
    dependent: :destroy

  has_rich_text :body
  has_noticed_notifications model_name: "Notification"

  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :body, presence: true
end
