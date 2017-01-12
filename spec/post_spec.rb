require_relative "./spec_helper"

xdescribe Post do
  let(:content) { 'big string'}
  let(:post) { Post.new(author_id: 1, content: content, vote_count: 0) }
  describe 'associations' do

  end

  xit "has author_id" do
      expect(post.author_id).to eq 1
  end

  xit "has content" do
    expect(post.content).to eq content
  end

  xit "has vote_count" do
    expect(post.vote_count).to eq 0
  end


end
