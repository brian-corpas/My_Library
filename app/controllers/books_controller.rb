class BooksController < ApplicationController
 skip_before_action :verify_authenticity_token

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book added to Library'
      redirect_to books_path
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render "edit"
    end
  end



  private

  def book_params
    params.require(:book).permit(:name, :author)
  end
end
