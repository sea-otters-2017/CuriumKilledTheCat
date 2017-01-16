require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

# def generate_id(exclude_id)
#   ids = Array(1..10).select { |number| number != exclude_id }
#   ids.sample
# end

# 10.times do
#   user = User.create(username: Faker::Internet.user_name, password: 'pw')
#   5.times do
#     question = Question.create(title: Faker::Hacker.say_something_smart, content: Faker::ChuckNorris.fact, author_id: user.id)
#     5.times do
#       answer = Answer.create(author_id: generate_id(user.id), content: Faker::Hipster.paragraph, question_id: question.id)
#       3.times do
#         comment = Comment.create(content: Faker::Hipster.sentence, author_id: generate_id(user.id), answer_id: answer.id)
#       end
#     end
#   end
# end



rand(10..30).times {User.create(username: Faker::Internet.user_name, password: 'pw')}

user_ids = User.ids

rand(50..90).times{
  Question.create(
    title: Faker::Hacker.say_something_smart,
    content: Faker::ChuckNorris.fact,
    author_id: user_ids.sample)}

question_ids = Question.ids

rand(150..350).times{
  Answer.create(
    author_id: user_ids.sample,
    content: Faker::Hipster.paragraph,
    question_id: question_ids.sample
    )
}

answer_ids = Answer.ids

rand(450..800).times {
  Comment.create(
    content: Faker::Hipster.sentence,
    author_id: user_ids.sample,
    answer_id: answer_ids.sample
    )
}

comment_ids = Comment.ids

vote_values = [-1,1,1,1]

3000.times do
  unless rand(2) == 0
    QuestionVote.create(author_id: User.ids.sample,question_id: Question.ids.sample, vote_count: vote_values.sample)
  end
  unless rand(2) == 0
    CommentVote.create(author_id: user_ids.sample,comment_id: comment_ids.sample, vote_count: vote_values.sample)
  end
  unless rand(2) == 0
    AnswerVote.create(author_id: user_ids.sample,answer_id: answer_ids.sample, vote_count: vote_values.sample)
  end
end

Question.all.each do |question|
  unless rand(2) == 0
    question.update(best_answer_id: question.answers.ids.sample)
  end
end

