class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @book = Book.new
  end

  def create
    @user = User.find(params[:user_id])
    @book = Book.new(book_params)
    @book.user = @user
    if @book.save
      redirect_to user_books_path
      flash[:notice] = 'Success. Your book was added to the Library'
    else
      render "new"
      flash[:notice] = 'Book not created. Please try again'

    end
  end

  def edit
    @user = User.find(params[:user_id]
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to user_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
