class UsersController < ApplicationController
  # Adds: reject not-signin users
  before_action :authenticate_user!

  # Adds: reject not-edit another user prifiles
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all.order(created_at: :desc)
    @book_new = Book.new # left content
    @user = current_user # left content
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new # left content
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # Update Validations
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updatad user successfully."
    else
      render :edit
    end
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
