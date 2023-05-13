require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
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

  it 'shows the post title in the post show page' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.title)
  end

  it 'shows the author of the post in the post show page' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.author.name)
  end

  it 'shows how many comments a post has in the post show page' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.comments_counter)
    expect(@first_post.comments_counter).to eq(1)
  end

  it 'shows how many likes a post has in the post show page' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.likes_counter)
    expect(@first_post.likes_counter).to eq(2)
  end

  it 'shows the body of the post in the post show page' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.text)
  end

  it 'shows the username the comment author in the post show page' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_comment.author.name)
  end

  it 'shows the comment that the author left in the post show page' do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content("#{@first_post.author.name} : #{@first_comment.text}")
  end
end
