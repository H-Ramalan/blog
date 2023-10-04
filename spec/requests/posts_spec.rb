require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'returns a correct response status' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in response body' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Here is the list of all posts')
    end
  end

  describe 'GET / users/:user_id/posts/:id' do
    it 'renders the show template' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'returns a correct response status' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct placeholder text in response body' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('Here are post for every user')
    end
  end
end
