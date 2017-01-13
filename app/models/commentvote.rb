class CommentVote < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id
  belongs_to :comment, foreign_key: :comment_id

  validates :author_id, :comment_id, presence: true
end
