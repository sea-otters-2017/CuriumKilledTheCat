require 'spec_helper'


describe 'User Controller' do

  describe 'GET "/user/new"' do
    it 'loads the registration page' do
      get('/user/new')
      expect(last_response).to be_ok
    end

    it 'contains registration form' do
      get('/user/new')
      expect(last_response.body).to have_tag('form', with: {:action => '/user', :method => 'POST'})
    end
  end

  describe 'GET "/login"' do
    it 'loads the login page' do
      get('/user/login')
      expect(last_response).to be_ok
    end

    it 'contains login form' do
      get('/user/login')
      expect(last_response.body).to have_tag('form', with: {:action => '/user/login', :method => 'POST'})
    end
  end

  describe 'POST "/login"' do
    before :all do
      User.delete_all
      @user = User.create(username: 'phteven', password: 'password')
    end

    it 'logs in users who give correct information' do
      post '/user/login', params={username: 'phteven', password: 'password'}
      expect(session[:user_id]).to eq @user.id
    end

    it 'redirects users who successfully login to the home page' do
      post '/login', params={user: {username: 'phteven', password: 'password'}}
      follow_redirect!

      expect(last_request.url).to eq 'http://example.org/'
      expect(last_request.request_method).to eq 'GET'
    end

    it 'shows users who unsuccessfully login the login page again' do
      post '/login', params={user: {username: 'phteven', password: 'not the password'}}

      expect(last_response.body).to have_tag('form', with: {:action => '/login', :method => 'post'})
    end

    it 'contains login form' do
      get('/login')
      expect(last_response.body).to have_tag('form', with: {:action => '/login', :method => 'post'})
    end
  end


  describe 'GET "/logout"' do
    it 'loads the home page' do
      get '/logout'
      follow_redirect!

      expect(last_request.url).to eq 'http://example.org/'
      expect(last_request.request_method).to eq 'GET'
      expect(last_response).to be_ok
    end

    it 'logs a user out' do
      User.create(username: 'phteven', password: 'password')
      post '/login', params = {user: {username: 'phteven', password: 'password'}}
      expect(session[:user_id]).to_not be nil
      get '/logout'
      expect(session[:user_id]).to eq nil
    end
  end

  describe 'POST "/user"' do
    before :each do
      User.delete_all
    end

    it 'creates a new user with a name and password' do
      count = User.count
      post '/user', params={user: {username: 'phteven', password: 'password'}}
      expect(User.count).to eq (count + 1)
    end

    it 'redirects to the home page if successful' do
      post '/user', params={user: {username: 'phteven', password: 'password'}}
      follow_redirect!

      expect(last_request.url).to eq 'http://example.org/'
      expect(last_response).to be_ok
    end

    it 'displays form again if unsuccesful' do
       post '/user'

      expect(last_request.url).to eq 'http://example.org/user'
      expect(last_response.body).to have_tag('form', with: {:action => '/user', :method => 'post'})
      expect(last_response).to be_ok
    end
  end

  describe 'GET "/user/:id"' do
    before :all do
      @user = User.create(username: 'phteven', password: 'password')
    end

    it 'shows a user their own profile when logged in' do
      post '/login', params = {user: {username: 'phteven', password: 'password'}}
      get "/user/#{@user.id}"

      expect(last_response.body).to have_tag('h2', with: {class: 'profile'})
    end

    it 'shows a user an error page when not logged in' do
      get "/user/#{@user.id}"

      expect(last_response.body).to have_tag('h3', with: {class: 'error'})
    end
  end
end
