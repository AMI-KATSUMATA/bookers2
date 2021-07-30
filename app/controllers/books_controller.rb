class BooksController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @new = Book.new
    @books = Book.all
  end

  def show
    @new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new
  end

  def create
    @new = Book.new(book_params)
    @new.user_id = current_user.id
    if @new.save
  # 投稿詳細へリダイレクト
    redirect_to book_path(@new), notice: 'You have created book successfully.'
    else
    @user = User.find(current_user.id)
    @books = Book.all
    render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    # 投稿詳細ページへのリンク
    redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
     render :edit
    end
   end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    # 投稿一覧にリンク
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end