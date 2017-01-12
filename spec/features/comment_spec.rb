require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Comment.new(author_id: 1, content: "Here is my comment!", vote_count: 3456)
  end

  describe 'validations' do
    it 'validates an author_id' do
      should validate_presence_of :author_id
    end
    it 'validates that the comment has content' do
      should validate_presence_of(:content)
    end
    it 'validates that the comment has a vote_count' do
      should validate_presence_of(:vote_count)
    end
  end

  describe 'associations' do
    it 'it should belong to a author' do
      should belong_to(:author)
    end

    it "returns the id of the comment's author" do
      expect(@comment.author_id).to eq(1)
    end

    it "returns the comment's content" do
      expect(@comment.content).to eq("Here is my comment!")
    end

  end
end
