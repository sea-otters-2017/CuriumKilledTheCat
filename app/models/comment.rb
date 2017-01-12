class Comment < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id

  validates :author_id, presence: true
end
