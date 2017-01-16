enable :sessions

get '/user/new' do
  @user = User.new
  erb :'user/new'
end

get '/register-ajax' do
  erb :'partials/_registration_form', layout: false
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

get '/user/login' do
  @user = User.new
  erb :'user/login'
end

get '/login_ajax' do
  erb :'partials/_login_form', layout: false
end

post '/user/login' do
  @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  if @user
    session_login(@user.id)
    redirect '/'
  else
    erb :'/user/login'
  end
end

get '/user/logout' do
  session[:user_id] = nil
  redirect '/'
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
