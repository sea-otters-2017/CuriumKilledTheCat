class QuestionVote < ActiveRecord::Base
    belongs_to :author, class_name: 'User'
    belongs_to :question, foreign_key: :question_id

    validates :vote_count, inclusion: { in: [-1,1] }, presence: true
    validates :author_id, :question_id, presence: true
end
