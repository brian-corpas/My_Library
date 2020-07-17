class BooksController < ApplicationController

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
  end

  def update

  end



  private

  def book_params
    params.require(:book).permit(:name, :author)
  end
end
