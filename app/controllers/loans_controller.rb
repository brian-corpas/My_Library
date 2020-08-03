class LoansController < ApplicationController

  def index
    @loans = policy_scope(Loan)
    @book.loan_status = true
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
    @loan = Loan.find(params[:loan_id])
    @loan.destroy
    @book.loan_status = false
    authorize @loan
    redirect_to user_books_path
  end


  private

  def loan_params
    params.require(:loan).permit(:name, :date)
  end

end
