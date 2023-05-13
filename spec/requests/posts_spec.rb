require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @first_user = User.create(
      name: 'first User',
      photo: 'https://myphoto.com/photos/user/1',
      bio: 'first User bio',
      posts_counter: 0
    )
    @first_post = Post.create(
      title: 'first Post',
      text: 'first Post text',
      comments_counter: 0,
      likes_counter: 0,
      author: @first_user
    )
  end

  describe 'GET /index' do
    it 'returns http success' do
      get user_posts_path(@first_user.id)
      expect(response).to have_http_status(:success)
    end

    it 'returns render index template' do
      get user_posts_path(@first_user.id)
      expect(response).to render_template(:index)
    end

    it 'body includes correct placeholder text' do
      get user_posts_path(@first_user.id)
      expect(response.body).to include('first User')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get user_post_path(@first_user, @first_post)
      expect(response).to have_http_status(:success)
    end

    it 'returns render show template' do
      get user_post_path(@first_user, @first_post)
      expect(response).to render_template(:show)
    end

    it 'body includes correct placeholder text' do
      get user_post_path(@first_user, @first_post)
      expect(response.body).to include('first User')
    end
  end
end
