class AnswerVote < ActiveRecord::Base
    belongs_to :author, class_name: 'User'
    belongs_to :answer, foreign_key: :answer_id

    validates :author_id, uniqueness: { scope: :answer_id }
    validates :vote_count, inclusion: { in: [-1,1] }, presence: true
    validates :author_id, :answer_id, presence: true
end
