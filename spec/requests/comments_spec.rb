require 'rails_helper'

RSpec.describe 'Comments', type: :request do
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

  describe 'GET /new' do
    it 'returns http success' do
      get new_user_post_comment_path(@first_user, @first_post)
      expect(response).to have_http_status(:success)
    end
  end
end
