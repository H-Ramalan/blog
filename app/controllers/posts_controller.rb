class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params.require(:post).permit(:title, :text))
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path(id: current_user)
    else
      render :new
    end
  end
end
