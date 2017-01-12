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
    xit 'should have many comments' do
      should have_many :comments
    end
    xit 'should have many questions' do
      should have_many :questions
    end
    xit 'should have many answers' do
      should have_many :answers
    end
    it 'should have many votes' do
      should have_many :votes
    end
  end
end
