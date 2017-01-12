class Comment < ActiveRecord::Base
  belongs_to :user, index: true
  
  validates :author_id, presence: true
end
