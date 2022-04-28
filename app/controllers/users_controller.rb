class UsersController < ApplicationController

  before_action :authenticate_user!


  def  create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice:"Book was successfully created"
    else
    render :new
    end
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to  user_path(current_user), notice:"You have updated user successfully."
    else
    render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
