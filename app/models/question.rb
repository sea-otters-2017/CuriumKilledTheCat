class Question < ActiveRecord::Base
  include Votable

  belongs_to :author, class_name: 'User'
  has_many :votes, class_name: 'QuestionVote'
  has_many :answers
  has_many :comments, through: :answers

  validates :title, :author_id, :content, presence: true
end
