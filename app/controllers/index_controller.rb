# require 'kaminari/sinatra'

get '/' do
  page = 1 || params[:page]

  @questions = Question.all.order(created_at: :desc).limit(10)
  erb :index
end
