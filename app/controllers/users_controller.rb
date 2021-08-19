class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

    def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
    end

    def create

    end

    def new
      @book = Book.new
    end
end
