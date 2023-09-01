class PostsController < ApplicationController
  load_and_authorize_resource param_method: :posts_params

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(id: @post.author_id)
    else
      render :new, alert: 'ERROR! something went wrong while creating the post'
    end
  end

  def show
    @post = Post.includes(:author).find(params[:id])
    @user = current_user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.author.decrement!(:posts_counter)
    @post.destroy
    flash[:success] = 'Post was successfully deleted'
    redirect_to user_path(@post.author)
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
