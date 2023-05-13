class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comments_counter
  after_destroy :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  def as_json(options = {})
    super({ only: %i[text author_id post_id] }.merge(options))
  end
end
