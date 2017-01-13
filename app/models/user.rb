require 'bcrypt'

class User < ActiveRecord::Base
  has_many :votes, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :questions, foreign_key: :author_id

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
