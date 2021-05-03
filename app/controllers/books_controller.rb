class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    unless params[:term].present?
      @books = policy_scope(Book)
    else
      @books = policy_scope(Book)
      @books = Book.search_by_full_name(params[:term])
    end
    @books = Book.order(:title)
    respond_to do |format|
      format.html
      format.csv { send_data @books.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
    @books = Book.paginate(page: params[:page])
  end

  def show
    @book = Book.find(params[:id])
    authorize @book
  end

  def new
    @user = User.find(params[:user_id])
    @book = Book.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    authorize @book
  end

  def create
    @user = User.find(params[:user_id])
    @book = Book.new(book_params)
    # @book.category_id = params[:category_id] 
    @book.user = @user
    authorize @book
    if @book.save
      redirect_to user_books_path
      flash[:notice] = 'Success. Your book was added to the Library'
    else
      render "new"
      flash[:notice] = 'Book not created. Please try again'

    end
  end

  def edit
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    authorize @book
  end

  def update
    @book = Book.find(params[:id])
    @book.category_id = params[:category_id]
    @book.update(book_params)
    authorize @book
    redirect_to user_book_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    authorize @book
    redirect_to user_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :photo, :comments, :category_id)
  end
end
