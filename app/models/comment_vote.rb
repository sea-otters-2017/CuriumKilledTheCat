class CommentVote < ActiveRecord::Base
    belongs_to :author, class_name: 'User'
    belongs_to :comment, foreign_key: :comment_id

    validates :vote_count, inclusion: { in: [-1,1] }, presence: true
    validates :author_id, :comment_id, presence: true
end
