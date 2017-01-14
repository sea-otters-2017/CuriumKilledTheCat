require 'spec_helper'

describe User do

  describe 'validations' do
    it 'it should require a unique user name' do
      should validate_presence_of :username
      should validate_uniqueness_of :username
    end

    it 'it should require a password' do
      should have_secure_password
    end
  end

  describe 'associations' do
    it 'should have many comments' do
      should have_many :comments
    end
    it 'should have many questions' do
      should have_many :questions
    end
    it 'should have many answers' do
      should have_many :answers
    end

    it 'should have many question votes' do
      should have_many :question_votes
    end
    it 'should have many answer votes' do
      should have_many :answer_votes
    end
    it 'should have many comment votes' do
      should have_many :comment_votes
    end
    it 'should have many voted comments' do
      should have_many :voted_comments
    end
    it 'should have many voted questions' do
      should have_many :voted_questions
    end
    it 'should have many voted answers' do
      should have_many :voted_answers
    end
  end
end
