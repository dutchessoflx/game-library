class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    loan = Loan.create loan_params
    
    redirect_to loans_path
  end

  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find params[:id]
  end

  def edit
    @loan = Loan.find params[:id]
  end

  def update
    @loan = Loan.find params[:id]
    @loan.update loan_params
    redirect_to loan_path(@loan.id)
  end

  def destroy
    Loan.destroy params[:id]
    redirect_to loans_path
  end

  private
  def loan_params
    params.require(:loan).permit(:user_id, :game_id, :start_date, :end_date, :status)
  end

end
