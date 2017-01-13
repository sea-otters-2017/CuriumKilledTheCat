require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

def generate_id(exclude_id)
  valid_ids = [1..10].select { |number| number != exclude_id }
  valid_ids.select
end

10.times do
  user = User.create(username: Faker::Internet.user_name, password: 'pw')
  15.times do
    question = Question.create(title: Faker::Hacker.say_something_smart, content: Faker::ChuckNorris.fact, author_id: user.id)
    5.times do
      answer = Answer.create(author_id: generate_id(user.id), content: Faker::Hipster.paragraph, question_id: question.id, vote_count: 0)
      3.times do
        comment = Comment.new(content: Faker::Hipster.sentence, author_id: generate_id(user.id), answer_id: answer.id, vote_count: 0)
      end
    end
  end
end
