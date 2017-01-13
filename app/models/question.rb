class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :votes, class_name: 'QuestionVote'
  has_many :comments
  has_many :answers


  validates :title, :author_id, :content, presence: true
end
