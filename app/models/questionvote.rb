class QuestionVote < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id
  belongs_to :question, foreign_key: :question_id

  validates :author_id, :question_id, presence: true
end
