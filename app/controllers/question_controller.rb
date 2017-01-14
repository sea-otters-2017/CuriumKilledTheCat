get '/questions/new' do
  unless User.find_by_id(session[:user_id]).try(:id)
    return erb :'404'
  end

  @question = Question.new
  erb :'/question/new'
end

post '/questions' do
  params[:question][:author_id] = User.find_by_id(session[:user_id]).id
  unless params[:question][:author_id]
    return erb :'404'
  end
  @question = Question.create(params[:question])
  if @question.persisted?
    redirect ('/questions/' + @question.id.to_s)
  else
    erb :'/question/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  if @question
    erb :'question/show'
  end
end
