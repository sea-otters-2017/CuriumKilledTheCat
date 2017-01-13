require 'faker'

User.delete_all
Question.delete_all

10.times do
  user = User.create(username: Faker::Internet.user_name, password: 'pw')
  15.times do
    question = Question.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, author_id: user.id)
  end
end
