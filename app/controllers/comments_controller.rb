class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])

    if @comment.save
      redirect_to user_posts_path(@post.author_id)
    else
      render :new, alert: 'ERROR! something went wrong while creating the comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.post.decrement!(:comments_counter)
    @comment.destroy!
    flash[:success] = 'The comment was successfully deleted.'
    redirect_to user_posts_path(current_user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
