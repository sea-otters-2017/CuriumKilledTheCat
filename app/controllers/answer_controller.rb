
# goes to the form page for answering a question
get '/questions/:id/answers/new' do
  unless session_user
    return erb :'404'
  end

  @question = Question.find_by_id(params[:id])
  erb :'answer/new'
end

post '/questions/:id/answers' do
  unless session_user
    return erb :'404'
  end
  @question = Question.find(params[:id])
  @answer = Answer.create(content: params[:content], author_id: session_user_id, question_id: @question.id)
  redirect "/questions/#{@question.id}"
end
