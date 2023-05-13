require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      author: User.new(
        name: 'Francisco', photo: 'www.photo.com', bio: 'bio info', posts_counter: 0
      ),
      title: 'Some Title',
      text: 'Some Text',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  it 'checks title should be present' do
    expect(subject).to be_valid
  end

  it 'checks title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'checks title should not exceed 250 characters' do
    subject.title = 'a' * 250
    expect(subject).to be_valid
  end

  it 'checks title should not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'checks comments_counter to be integer' do
    subject.comments_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'checks comments_counter to be greater or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'checks likes_counter to be integer' do
    subject.likes_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'checks likes_counter to be greater or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'show the last 5 recent comments' do
    second_comment = Comment.create(post: subject, author: subject.author, text: 'second comment text')
    third_comment = Comment.create(post: subject, author: subject.author, text: 'third comment text')
    forth_comment = Comment.create(post: subject, author: subject.author, text: 'forth comment text')
    fifth_comment = Comment.create(post: subject, author: subject.author, text: 'fifth comment text')
    sixth_comment = Comment.create(post: subject, author: subject.author, text: 'sixth comment text')
    results = [sixth_comment, fifth_comment, forth_comment, third_comment, second_comment]
    expect(subject.recent_comments).to eq(results)
  end
end
