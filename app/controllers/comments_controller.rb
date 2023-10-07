class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comments_params)

    if @comment.save
      flash[:success] = 'Comment successfully created'
      redirect_to user_posts_path
    else
      render :new
    end
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
