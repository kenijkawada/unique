class Introduction < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true, foreign_key: 'user_id'

  validates :image, presence: true
  validates :area, presence: true
  validates :body, presence: true
end
