class Vote < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id
  belongs_to :comment
  belongs_to :question
  belongs_to :answer

  validates :author_id, :comment_id, :question_id, :answer_id, presence: true
end
