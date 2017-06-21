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
    if request.xhr?
      status 200
    else
      redirect '/'
    end
  else
    if request.xhr?
      status 422
      erb :'/partials/_errors', locals: {:object => @user}, layout: false
    else
      erb :'user/new'
    end
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
