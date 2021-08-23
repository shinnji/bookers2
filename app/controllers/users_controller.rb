class UsersController < ApplicationController

 before_action :authenticate_user!
    before_action :correct_user,only: [:edit]

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

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
    if  @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
    else
    render :edit
    end
    end

    def edit
      @user = User.find(params[:id])
    end

    def index
      @user = current_user
      @users = User.all
      @book = Book.new
    end

      private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

 private

def correct_user
        user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
end

end
