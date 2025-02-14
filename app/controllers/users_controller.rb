class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books

  end


   def index
   @users = User.all
   @user = current_user
   @book = Book.new
   end


  def edit
   @user = User.find(params[:id])

  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:succes] = "User was successfully updated."
     redirect_to user_path(@user)
   else
    flash[:error] = "Error updating user."
    render :edit
   end
     
  end


  private
  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
