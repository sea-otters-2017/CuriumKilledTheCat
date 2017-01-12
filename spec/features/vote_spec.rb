require 'spec_helper'

describe Vote do
  before(:each) do
    @vote = Vote.new(author_id: 1, post_id: 1)

  describe 'associations' do
    it 'verifies the belongs_to association of user' do
      should belong_to(:user)
    end
    it 'verifies the belongs_to association of comment' do
      should belong_to(:comment)
    end
    it 'verifies the belongs_to association of question' do
      should belong_to(:question)
    end
    it 'verifies the belongs_to association of answer' do
      should belong_to(:answer)
    end
  end

    it "returns the id of the vote's author" do
      expect(@vote.author_id).to eq(1)
    end

    it "returns the id of the vote's post" do
      expect(@vote.post_id).to eq(1)
    end

  describe 'validations' do
    it 'validates that the vote has an author_id' do
      should validate_presence_of(:author_id)
    end
  end
  end
end
