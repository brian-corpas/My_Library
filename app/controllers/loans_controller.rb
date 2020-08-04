class LoansController < ApplicationController

  def index
    @books = policy_scope(Book)
    @loans = policy_scope(Loan)
  end

  def new
    @book = Book.find(params[:book_id])
    @loan = Loan.new
    authorize @loan
  end

  def create
    @book = Book.find(params[:book_id])
    @loan = Loan.new(loan_params)
    @loan.book = @book
    authorize @loan
    if @loan.save
      @book.loan_status = true
      redirect_to user_books_path
      flash[:notice] = 'Success. Your book was loaned!'
    else
      render "new"
      flash[:notice] = 'Please enter loan info again!'
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    authorize @loan
    if @loan.destroy
      redirect_to user_books_path
      flash[:notice] = 'Book returned!'
    else
      flash[:notice] = 'Book still not returned!'
    end
  end


  private

  def loan_params
    params.require(:loan).permit(:name, :date, :photo)
  end

end
