enable :sessions

get '/user/new' do
  @user = User.new
  if request.xhr?
    erb :'partials/_registration_form', layout: false
  else
    erb :'user/new'
  end
end

post '/user' do
  @user = User.create(params[:user])
  if @user.persisted?
    session_login(@user.id)
    redirect '/'
  else
    erb :'user/new'
  end
end

get '/user/:id' do
  @user = User.find_by_id(params[:id])

  if @user && @user == User.find_by_id(session_user_id)
    erb :'user/personal_profile'
  elsif @user
    erb :'user/profile'
  else
    erb :'404'
  end
end
