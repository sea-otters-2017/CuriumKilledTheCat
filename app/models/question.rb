class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  has_many :question_votes
  has_many :answers
  has_many :comments#, through: :answers

  validates :title, :author_id, :content, presence: true
end
