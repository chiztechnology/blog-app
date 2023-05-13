require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
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
    @first_post = Post.create(title: 'first Post', text: 'first Post text', comments_counter: 0, likes_counter: 0,
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
    visit user_path(@first_user)
    expect(page).to have_css("img[src='#{@first_user.photo}']")
  end

  it 'shows the users username in the show page' do
    visit user_path(@first_user)
    expect(page).to have_content(@first_user.name)
  end

  it 'shows the number of post the user has written' do
    visit user_path(@first_user)
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'shows the users bio in the show page' do
    visit user_path(@second_user)
    expect(page).to have_content(@second_user.bio)
  end

  it 'show the users first 3 posts in the show page' do
    visit user_path(@first_user)
    expect(page).to have_content(@first_post.title)
    expect(page).to have_content(@second_post.title)
    expect(page).to have_content(@third_post.title)
  end

  it 'shows me a button to view all the post from the user' do
    visit user_path(@second_user)
    expect(page).to have_content('See all posts')
  end

  it 'When I click a users post, it redirects me to that posts show page' do
    visit user_posts_path(@first_user)
    click_link @first_post.title.to_s
    expect(page).to have_current_path(user_post_path(@first_user, @first_post))
  end

  it 'When I click to see all posts, it redirects me to the users posts index page' do
    visit user_path(@first_user)
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@first_user))
  end
end
