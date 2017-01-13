class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :questions

  validates :author_id, :content, :vote_count, presence: true
end
