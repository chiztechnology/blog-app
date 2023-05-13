require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @first_user = User.create(
      name: 'first User',
      photo: 'https://myphoto.com/photos/user/1',
      bio: 'first User bio',
      posts_counter: 0
    )
  end

  describe 'GET /index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'returns render index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'body includes correct placeholder text' do
      get users_path
      expect(response.body).to include('Users List')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get user_path(@first_user)
      expect(response).to have_http_status(:success)
    end

    it 'returns render show template' do
      get user_path(@first_user)
      expect(response).to render_template(:show)
    end

    it 'body includes correct placeholder text' do
      get user_path(@first_user)
      expect(response.body).to include('first User')
    end
  end
end
