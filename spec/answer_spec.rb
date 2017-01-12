require 'spec_helper'

describe Answer do
  before(:each) do
    @answer = Answer.new(author_id: 1, post_id: 1)
  end

  describe 'associations' do
    it 'verifies the belongs_to association of user' do
      should belong_to(:user)
    end
  end

  describe 'attributes' do
    it "returns the id of the vote's author" do
      expect(@vote.author_id).to eq(1)
    end

    it "returns the id of the vote's post" do
      expect(@vote.post_id).to eq(1)
    end
  end

  describe 'validations' do
    it 'validates that the vote has an author_id' do
      should validate_presence_of(:author_id)
    end
  end
end
