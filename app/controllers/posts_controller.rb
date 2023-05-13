class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :author)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |f|
      if @post.save
        f.html { redirect_to user_posts_path }
      else
        f.html { render :new }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    respond_to do |f|
      f.html { redirect_to user_posts_path(current_user), notice: 'The Post has been destroyed successfully' }
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
