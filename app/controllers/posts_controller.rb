class PostsController < ApplicationController

  before_action :find_post_by_id, only: [:show, :edit, :update, :destroy]
  before_action :post_params, only: [:create, :update]

  def index

    @posts = Post.all.page(params[:page])
    param = params[:ordering]

    if param === "Title-ASC"
      @posts = Post.order(title: :asc).page(params[:page])
    end

    if param === "Title-DESC"
      @posts = Post.order(title: :desc).page(params[:page])
    end

    if param === "Date-ASC"
      @posts = Post.order(created_at: :asc).page(params[:page])
    end

    if param === "Date-DESC"
      @posts = Post.order(created_at: :desc).page(params[:page])
    end

  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post has been created successfully"
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post has been updated successfully"
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post has been deleted successfully"
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, images:[])
  end

  def find_post_by_id
    @post = Post.find(params[:id])
  end


end