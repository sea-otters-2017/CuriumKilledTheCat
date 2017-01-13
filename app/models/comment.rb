class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :answer

  validates :author_id, :content, :answer_id, :vote_count, presence: true
end
