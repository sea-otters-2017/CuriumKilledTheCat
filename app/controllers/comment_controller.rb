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


  if request.xhr?
    hash = {content: @comment.content, author_id: @comment.author_id}
    json hash
  else
    redirect '/questions/' + question.id.to_s
  end
end

get '/new_comment/:answer_id' do
  unless session_user
    status 404
    return erb :'404', layout: false
  end

  if request.xhr?
    @answer = Answer.find_by_id(params[:answer_id])
    erb :'partials/_new_comment', layout: false
  end
end
