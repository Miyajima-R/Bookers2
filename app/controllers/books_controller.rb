class BooksController < ApplicationController
 def index
     @user = current_user
     @books = Book.all
     @book = Book.new
 end

 def create
    @book = Book.new(book_params)
    @user = current_user

   if @book.save
     @user.increment!(:books_count)
     flash[:notice] = 'Book created successfully.'
     redirect_to book_path(@user.id)
   else
     @books = Book.all
     flash[:error] = "can't be blank."
     render :index
   end
 end


 def show
   @user = current_user
   @book = Book.find(params[:id])
   @books =Book.new

 end

 def edit
   @user = current_user
   @book = Book.find(params[:id])

 end

def update
 @book = Book.find(params[:id])
  if @book.update(book_params)
   flash[:success] = "You have created book successfully."
  else
    flash.now[:error] = @book.errors.full_messages.join('. ')
  end
  redirect_to book_path(@book.id)
end


   def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
   end

private
    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end
end
