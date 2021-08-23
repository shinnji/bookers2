class BooksController < ApplicationController

  before_action :authenticate_user!
    before_action :correct_user,only: [:edit]


  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


  def create
    @book = Book.new(book_params)
     @book.user_id = current_user.id
      if @book.save
        flash[:notice] = 'You have created book successfully.'
     redirect_to book_path(@book)
      else
        @books = Book.all
     render :index
      end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
    redirect_to book_path(@book)
    else
    render :edit
    end
  end

    private

  def book_params
    params.require(:book).permit(:title, :body)
  end
    private
  def correct_user
        book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end

end
