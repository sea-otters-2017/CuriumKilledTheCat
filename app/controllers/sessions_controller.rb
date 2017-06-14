get '/user/login' do
  @user = User.new
  if request.xhr?
    erb :'partials/_login_form', layout: false
  else
    erb :'user/login'
  end
end

post '/user/login' do
  @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  if @user
    session_login(@user.id)
    redirect '/'
  else
    @user = User.new
    @user.errors.add(:username, 'and Password do not match')
    erb :'/user/login'
  end
end

get '/user/logout' do
  session[:user_id] = nil
  redirect '/'
end
