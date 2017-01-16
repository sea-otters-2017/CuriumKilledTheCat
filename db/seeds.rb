require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

def generate_id(exclude_id)
  ids = Array(1..10).select { |number| number != exclude_id }
  ids.sample
end

10.times do
  user = User.create(username: Faker::Internet.user_name, password: 'pw')
  5.times do
    question = Question.create(title: Faker::Hacker.say_something_smart, content: Faker::ChuckNorris.fact, author_id: user.id)
    5.times do
      answer = Answer.create(author_id: generate_id(user.id), content: Faker::Hipster.paragraph, question_id: question.id)
      3.times do
        comment = Comment.create(content: Faker::Hipster.sentence, author_id: generate_id(user.id), answer_id: answer.id)
      end
    end
  end
end
