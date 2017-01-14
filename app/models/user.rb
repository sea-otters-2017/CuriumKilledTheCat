require 'bcrypt'

class User < ActiveRecord::Base
  has_many :question_votes, foreign_key: :author_id
  has_many :answer_votes, foreign_key: :author_id
  has_many :comment_votes, foreign_key: :author_id

  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :questions, foreign_key: :author_id

  has_many :voted_questions, through: :question_votes, source: :question
  has_many :voted_answers, through: :answer_votes, source: :answer
  has_many :voted_comments, through: :comment_votes, source: :comment

  validates :username, presence: true, uniqueness: true
  has_secure_password

  def vote_total
    ct = self.comments.reduce(0){|memo, comment| memo + comment.vote_count}
    at = self.answers.reduce(0){|memo, answer| memo + answer.vote_count}
    qt = self.questions.reduce(0){|memo, question| memo + question.vote_count}
    ct + at + qt
  end
end
