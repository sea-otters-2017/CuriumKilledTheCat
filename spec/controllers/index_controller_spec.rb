require 'spec_helper'

describe 'index controller' do
  describe 'GET "/"' do
    it 'loads the homepage' do
      get('/')
      expect(last_response).to be_ok
    end

    it 'contains appropriate header' do
      get('/')
      expect(last_response.body).to include("home")
    end
  end
end
