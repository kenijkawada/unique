class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true, foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
end
