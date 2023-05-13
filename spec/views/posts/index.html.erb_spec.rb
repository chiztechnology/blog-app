require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    @first_user = User.create(
      name: 'Pedro Mandinga',
      photo: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Ill_dict_infernal_p0093-79_barbatos.jpg',
      bio: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      posts_counter: 3
    )
    @second_user = User.create(
      name: 'Simon Bolivar',
      photo: 'https://es.wikipedia.org/wiki/Sim%C3%B3n_Bol%C3%ADvar#/media/Archivo:Sim%C3%B3n_Bol%C3%ADvar,_1825.jpg',
      bio: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      posts_counter: 0
    )
    @first_post = Post.create(title: 'first Post', text: 'first Post text', comments_counter: 1, likes_counter: 2,
                              author: @first_user)
    @second_post = Post.create(title: 'second Post', text: 'second Post text', comments_counter: 0, likes_counter: 0,
                               author: @first_user)
    @third_post = Post.create(title: 'third Post', text: 'third Post text', comments_counter: 0, likes_counter: 0,
                              author: @first_user)
    @first_comment = Comment.create(
      author: @first_user,
      post: @first_post,
      text: 'first comment text'
    )
  end

  it 'shows the users profile picture in the show page' do
    visit user_posts_path(@first_user)
    expect(page).to have_css("img[src='#{@first_user.photo}']")
  end

  it 'shows the users username in the show page' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_user.name)
  end

  it 'shows the number of post the user has written' do
    visit user_posts_path(@first_user)
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'shows the post title in the index page' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.title)
  end

  it 'shows the post body in the index page' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.text)
  end

  it 'shows the first comment on a post in the index page' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_comment.text)
  end

  it 'shows how many comments a post has' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.comments_counter)
  end

  it 'shows how many likes a post has' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.likes_counter)
    expect(@first_post.likes_counter).to eq(2)
  end

  it 'shows a section for pagination if there are more posts that fit in the view' do
    visit user_posts_path(@first_user)
    expect(page).to have_content('Pagination')
  end

  it 'redirects to a specific post in the post show page' do
    visit user_posts_path(@first_user)
    click_link @first_post.title.to_s
    expect(page).to have_current_path(user_post_path(@first_user, @first_post))
  end
end
