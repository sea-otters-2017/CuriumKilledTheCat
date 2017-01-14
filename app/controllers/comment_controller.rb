get '/questions/:question_id/answers/:answer_id/new' do
  @question = Question.find_by_id(params[:question_id])
  @answer = Answer.find_by_id(params[:answer_id])
  unless @question && @answer
    erb :'404'
  end
  erb :'comment/new'
end

post '/answers/:id/new' do

  @comment = Comment.create(author_id: session_user_id, content: params[:content], answer_id: params[:id].to_i)
  question = Answer.find_by_id(params[:id]).question
  redirect '/questions/' + question.id.to_s
end
