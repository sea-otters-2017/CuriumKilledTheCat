enable :sessions

helpers do

  def session_user
    User.find(session_user_id) if session_user_id
  end

  def session_user_id
    session[:user_id]
  end

  def session_logout
    session.delete :user_id
  end

  def session_login(user_id)
    session[:user_id] = user_id
  end
end
