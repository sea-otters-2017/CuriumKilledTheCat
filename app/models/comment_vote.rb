class CommentVote < ActiveRecord::Base
    belongs_to :author, class_name: 'User'
    belongs_to :comment, foreign_key: :comment_id

    validates :author_id, :comment_id, presence: true
end
