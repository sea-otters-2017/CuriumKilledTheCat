require 'spec_helper'

describe QuestionVote do
  before(:each) do
    @question_vote = QuestionVote.create(author_id: 1, question_id: 1, vote_count: 1)
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

      it 'validates that the question has an question_id' do
        should validate_presence_of(:question_id)
      end

      it 'validates that the question has an vote_count' do
        should validate_presence_of(:vote_count)
      end

      it 'validates vote count to be a value of -1 or 1' do
        should validate_inclusion_of(:vote_count).in_array([-1,1])
      end

      subject { QuestionVote.new(question_id: 1, vote_count: 1) }
      it 'validates that author can\'t upvote an question more than once' do
        should validate_uniqueness_of(:author_id).scoped_to(:question_id)
      end
    end
end
