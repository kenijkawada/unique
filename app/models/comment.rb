class Comment < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: 'user_id'
  belongs_to :post, optional: true, foreign_key: 'post_id'
end
