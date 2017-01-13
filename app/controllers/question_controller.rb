get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'question/show'
end