helpers do
  def clear_missing_users
    if session[:user_id]
      if !User.find_by_id(session[:user_id])
        session[:user_id] = nil
      end
    end
  end
end
