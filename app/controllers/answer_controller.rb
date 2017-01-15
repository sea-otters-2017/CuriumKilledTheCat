require 'sinatra/json'


# goes to the form page for answering a question
get '/questions/:id/answers/new' do
   unless session_user
     return erb :'404'
   end

   @question = Question.find_by_id(params[:id])
   @answer = Answer.new
   erb :'answer/new'
end

post '/questions/:id/answers' do
  unless session_user
    return erb :'404'
  end

  @question = Question.find(params[:id])
  @answer = Answer.create(content: params[:content], author_id: session_user_id, question_id: @question.id)

  if @answer.persisted?

    if request.xhr?
      erb :'/partials/_ajax_answer', layout: false
    else
      redirect "/questions/#{@question.id}"
    end

  else

    if request.xhr?
      status 404
    else
      erb :'/answer/new'
    end

  end

end

get '/new_answer/:question_id' do
  unless session_user
    status 404
    return erb :'404', layout: false
  end

  if request.xhr?
    @question = Question.find_by_id(params[:question_id])
    erb :'partials/_new_answer', layout: false
  end
end
