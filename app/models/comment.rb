class Comment < ActiveRecord::Base
  include Votable
  
  belongs_to :author, class_name: 'User'
  belongs_to :answer
  has_many :votes, class_name: 'CommentVote'

  validates :author_id, :content, :answer_id, presence: true
end
