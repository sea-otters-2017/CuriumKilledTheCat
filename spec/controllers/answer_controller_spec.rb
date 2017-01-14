require 'spec_helper'

describe 'Answer Controller' do
  before :each do
    User.delete_all
    Answer.delete_all
    Question.delete_all
    @user = User.create(username: 'new-user', password: 'password')
    @question = Question.create(title: "How do I computer?", content: "Computering is hard. How do I do it?", author_id: @user.id)
    @answer = Answer.create(content: "I don't know", question_id: @question.id, author_id: @user.id)

  end

  describe 'GET "/questions/:id/answers/new"' do
    it 'loads the new answer page' do
      get "/questions/#{@question.id}/answers/new"
      expect(last_response).to be_ok
    end
  end

  describe "POST 'questions/:id/answers'" do
    it 'creates a new answer' do
      expect {
        post(
          "/questions/#{@question.id}/answers",
          { content: 'some content' },
          'rack.session' => { :user_id => @user.id }
        )
      }.to change{Answer.count}.by 1

    end

    #WIP
    xit 'redirects to the question' do
      post(
            "/questions/#{@question.id}/answers",
            { content: 'some content' },
            'rack.session' => { :user_id => @user.id }
          )
      
      # follow_redirect!
    end
  end

end
