class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.build(comments_params)
    # @comment.user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'Comment created successfully.'
      redirect_to users_posts_path(1, 1)
    else
      flash[:error] = 'Error creating comment.'
      redirect_to user_posts_path
    end
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
