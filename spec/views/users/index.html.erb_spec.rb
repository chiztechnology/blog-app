require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before(:each) do
    @first_user = User.create(
      name: 'Pedro Mandinga',
      photo: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Ill_dict_infernal_p0093-79_barbatos.jpg',
      bio: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      posts_counter: 0
    )
    @second_user = User.create(
      name: 'Simon Bolivar',
      photo: 'https://es.wikipedia.org/wiki/Sim%C3%B3n_Bol%C3%ADvar#/media/Archivo:Sim%C3%B3n_Bol%C3%ADvar,_1825.jpg',
      bio: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      posts_counter: 0
    )
  end

  it 'shows the user info as it loads the page' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@second_user.name)
  end

  it 'shows the user profile picture as it loads the page' do
    visit users_path
    expect(page).to have_css("img[src='#{@first_user.photo}']")
    expect(page).to have_css("img[src='#{@second_user.photo}']")
  end

  it 'shows the number of posts each user has written' do
    visit users_path
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    expect(page).to have_content("Number of posts: #{@second_user.posts_counter}")
  end

  it 'redirects me to the link of a selected user in the show page' do
    visit users_path
    click_link @first_user.name
    expect(page).to have_current_path(user_path(@first_user))
  end
end
