require 'spec_helper'

describe CommentVote do
  before(:each) do
    @comment_vote = CommentVote.new(author_id: 1, comment_id: 1, vote_count: 888)
  end
    describe 'associations' do
      it 'verifies the belongs_to association of user' do
        should belong_to(:author)
      end
      it 'verifies the belongs_to association of comment' do
        should belong_to(:comment)
      end
    end

    describe 'attributes' do
      it "returns the id of the comment vote's author" do
        expect(@comment_vote.author_id).to eq(1)
      end

      it "returns the id of the comment vote's post" do
        expect(@comment_vote.comment_id).to eq(1)
      end
    end

    describe 'validations' do
      it 'validates that the comment has an author_id' do
        should validate_presence_of(:author_id)
      end
    end

end
