class Answer < ActiveRecord::Base
  include Votable

  belongs_to :author, class_name: 'User'
  has_many :comments
  belongs_to :question
  has_many :votes, class_name: 'AnswerVote'

  validates :author_id, :content, :question_id, presence: true

  def is_best
    self.question.best_answer_id == self.id
  end
end
