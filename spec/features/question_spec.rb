require 'spec_helper'

describe Question do

  describe 'validations' do
    it 'it should require a title' do
      should validate_presence_of :title
    end

    it 'it should require an author_id' do
      should validate_presence_of :author_id
    end

    it 'it should require content' do
      should validate_presence_of :content
    end
  end

  describe 'associations' do

    it 'should have many votes' do
      should have_many :votes
    end

    it 'should have many answers' do
      should have_many :answers
    end


  end
end
