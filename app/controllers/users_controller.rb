class UsersController < ApplicationController

  before_action :find_user_by_id, only: [:show, :edit, :update, :destroy]
  before_action :user_params, only: [:create, :update]
  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]
  before_action :admin_associations, only: [:index, :destroy]
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    user = User.find_by(email: @user.email)
    if !user
      if @user.save
        flash[:success] = "User has been created successfully"
        redirect_to @user
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash[:error] = "This user has been signed up already by this email"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User has been updated successfully"
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User has been deleted successfully"
      redirect_to users_path
    end
  end


  private

  def find_user_by_id
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio, :website)
  end

end