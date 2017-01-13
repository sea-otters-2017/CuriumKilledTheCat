# require 'kaminari/sinatra'

get '/' do
  @questions = Question.all.order(created_at: :desc).limit(10)
  erb :index
end
