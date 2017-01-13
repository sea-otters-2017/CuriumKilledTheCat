class AnswerVote < ActiveRecord::Base
    belongs_to :author, class_name: 'User'
    belongs_to :answer, foreign_key: :answer_id

    validates  :author_id, :answer_id, presence: true
end
