require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a correct response status' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in response body' do
      get '/users'
      expect(response.body).to include('Here is the list of all users')
    end
  end

  describe 'GET / users/:id' do
    it 'renders the show template' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'returns a correct response status' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct placeholder text in response body' do
      get '/users/:id'
      expect(response.body).to include('This page shows the users posts and comments')
    end
  end
end
