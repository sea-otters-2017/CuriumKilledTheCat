require_relative "./spec_helper"

describe Post do
  let(:content) { 'big string'}
  let(:post) { Post.new(author_id: 1, content: content, vote_count: 0) }
  describe 'associations' do

  end

  it "has author_id" do
      expect(post.author_id).to eq 1
  end

  it "has content" do
    expect(post.content).to eq content
  end

  it "has vote_count" do
    expect(post.vote_count).to eq 0
  end 


end