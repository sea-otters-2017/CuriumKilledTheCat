get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'question/show'
end

# goes to the form page for answering a question
get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answer/new'
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
end
