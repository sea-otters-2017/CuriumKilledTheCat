get '/login' do
  @user = User.new
  if request.xhr?
    erb :'partials/_login_form', layout: false
  else
    erb :'user/login'
  end
end

post '/login' do
  @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  if @user
    session_login(@user.id)
    if request.xhr?
      status 200
    else
      redirect '/'
    end
  else
    @user = User.new
    @user.errors.add(:username, 'and Password do not match')
    if request.xhr?
      status 401
      erb :'/partials/_errors', locals: {:object => @user}, layout: false
    else
      erb :'/user/login'
    end
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
