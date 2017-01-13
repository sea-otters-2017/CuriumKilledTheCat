require 'spec_helper'

describe QuestionVote do
  before(:each) do
    @question_vote = QuestionVote.new(author_id: 1, question_id: 1, vote_count: 888)
  end

    describe 'associations' do
      it 'verifies the belongs_to association of user' do
        should belong_to(:author)
      end
      it 'verifies the belongs_to association of question' do
        should belong_to(:question)
      end
    end

    describe 'attributes' do
      it "returns the id of the question vote's author" do
        expect(@question_vote.author_id).to eq(1)
      end

      it "returns the id of the question vote's post" do
        expect(@question_vote.question_id).to eq(1)
      end
    end

    describe 'validations' do
      it 'validates that the question has an author_id' do
        should validate_presence_of(:author_id)
      end
    end
end
