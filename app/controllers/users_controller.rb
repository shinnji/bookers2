class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

    def destroy
    @book = current_user
    @book.destroy
    redirect_to book_path
    end

    def create

    end

    def new
      @book = Book.new
    end

    def update
      @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    end

    def edit
      @user = User.find(params[:id])
    end

    def index
      @user = current_user
      @users = User.all
    end

      private

  def user_params
    params.require(:user).permit(:title, :body)
  end
end
