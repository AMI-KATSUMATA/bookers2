class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @new = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def index
   @users = User.all
   @user = User.find(current_user.id)
   @new = Book.new
  end

   def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
   end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    # マイページへのリンク
     redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
     render :edit
    end
   end

   def follows
    user = User.find(params[:id])
    @users = user.followers
   end

   def followers
    user = User.find(params[:id])
    @users = user.followings
   end

   private

   def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
   end
end