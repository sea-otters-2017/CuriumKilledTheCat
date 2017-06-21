get '/questions/:question_id/answers/:answer_id/new' do
  unless session_user
    if request.xhr?
      status 401
      return
    else
      return erb :'404'
    end
  end

  @question = Question.find_by_id(params[:question_id])
  @answer = Answer.find_by_id(params[:answer_id])
  @comment = Comment.new
  unless @question && @answer
    return erb :'404'
  end
  if request.xhr?
    erb :'partials/_new_comment', layout: false
  else
    erb :'comment/new'
  end
end

post '/answers/:id/new' do

  unless session_user
    if request.xhr?
      status 401
      return
    else
      return erb :'404'
    end
  end

  @comment = Comment.create(author_id: session_user_id, content: params[:content], answer_id: params[:id].to_i)
  @answer = Answer.find_by_id(params[:id])
  @question = @answer.question

  if @comment.persisted?
    if request.xhr?
      erb :'/partials/_ajax_comment', layout: false
    else
      redirect '/questions/' + @question.id.to_s
    end

  else

    if request.xhr?
      status 404
    else
      erb :'comment/new'
    end

  end


end
