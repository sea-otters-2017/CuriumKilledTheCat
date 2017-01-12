require 'spec_helper'

describe Answer do
  before(:each) do
    @answer = Answer.new(author_id: 1, content: "Here is my content!", vote_count: 3456)
  end

  describe 'associations' do
    it 'verifies the belongs_to association of user' do
      should belong_to(:author)
    end

    it 'verifies the has_many association of votes' do
      should have_many(:votes)
    end
  end

  describe 'attributes' do
    it "returns the id of the vote's author" do
      expect(@answer.author_id).to eq(1)
    end

    it "returns the id of the vote's post" do
      expect(@answer.vote_count).to eq(3456)
    end
  end

  describe 'validations' do
    it 'validates that the vote has an author_id' do
      should validate_presence_of(:author_id)
    end
    it 'validates that the vote has content' do
      should validate_presence_of(:content)
    end
    it 'validates that the vote has a vote_count' do
      should validate_presence_of(:vote_count)
    end
  end
end
