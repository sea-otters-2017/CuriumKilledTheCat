get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'question/show'
end

# Belongs in vote controller?.
# Just checking that params[:vote_count] = 1 or -1
post '/questions/:id/votes' do 
  p "*******************"
  p params
  p "*******************"
  redirect to '/'
end