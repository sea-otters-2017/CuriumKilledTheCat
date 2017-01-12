class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :votes

  validates :author_id, :content, :vote_count, presence: true
end
