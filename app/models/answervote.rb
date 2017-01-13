class AnswerVote < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id
  belongs_to :answer, foreign_key: :answer_id

  validates  :answer_id, presence: true
end
