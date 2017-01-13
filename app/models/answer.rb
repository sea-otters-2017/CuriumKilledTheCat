class Answer < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :votes, class_name: 'AnswerVote'

  validates :author_id, :content, :question_id, :vote_count, presence: true
end
