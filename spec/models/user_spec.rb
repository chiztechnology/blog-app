require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Francisco', photo: 'www.photo.com', bio: 'bio info', posts_counter: 0) }

  before { subject.save }

  it 'checks name should be present' do
    expect(subject).to be_valid
  end

  it 'checks name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'checks posts_counter to be integer' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'checks posts_counter to be greater or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'show the last 3 recent posts' do
    second_post = Post.create(author: subject, title: 'second post', text: 'second post text', comments_counter: 0,
                              likes_counter: 0)
    third_post = Post.create(author: subject, title: 'third post', text: 'third post text', comments_counter: 0,
                             likes_counter: 0)
    forth_post = Post.create(author: subject, title: 'forth post', text: 'forth post text', comments_counter: 0,
                             likes_counter: 0)
    results = [forth_post, third_post, second_post]
    expect(subject.recent_posts).to eq(results)
  end
end
