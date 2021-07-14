class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
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
    @book = Book.find(params[:id])
  end
  
   def update
    @book = User.find(params[:id])
    @book.update(book_params)
    # 投稿詳細ページへのリンク
    redirect_to book_path(@book.id)
   end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    # 投稿一覧にリンク
    redirect_to books_path
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

　def book_params
　  params.require(:book).permit(:title, :body, :user_id)
　end

end


