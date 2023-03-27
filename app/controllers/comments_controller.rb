class CommentsController < ApplicationController

  before_action :comment_params, only: [:create]
  before_action :find_comment_by_id, only: [:create, :destroy]
  before_action :require_login, only: [:create, :destroy]

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Your comment has been sent successfully"
      redirect_to post_path(@post)
    else
      flash[:error] = "Your comment is empty"
      redirect_to post_path(@post)
    end
  end


  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Your comment has been deleted successfully"
      redirect_to post_path(@post)
    end
  end

  private

  def find_comment_by_id
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
