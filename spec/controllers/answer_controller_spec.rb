require 'spec_helper'

describe 'Answer Controller' do
  describe 'GET "/questions/:id/answers/new"' do
    before :all do
      @question = Question.create(title: "How do I computer?", content: "Computering is hard. How do I do it?", author_id: 1)
    end

    it 'loads the new answer page' do
      get("/questions/#{@question.id}/answers/new")
      expect(last_response).to be_ok
    end
  end

  describe

end
