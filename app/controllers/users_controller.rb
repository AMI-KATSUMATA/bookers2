class UsersController < ApplicationController
  def index
   @users = user.all
   @user = User.find(params[:id])
   @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  　@book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  # 投稿詳細へリダイレクト
    redirect_to book_path(@book)
  end
  
   def edit
    @user = User.find(params[:id])
   end
   
   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # マイページへのリンク
    redirect_to user_path(@user.id)
   end
   
   
   
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

　def book_params
　  params.require(:book).permit(:title, :body, :user_id)
　end
　