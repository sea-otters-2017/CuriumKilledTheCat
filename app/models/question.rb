class Question < Post
  # Remember to create a migration!
  validates :title, presence: true
end
