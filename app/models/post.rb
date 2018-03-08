class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :content, presence: true

  belongs_to :user, optional: true, foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
end
