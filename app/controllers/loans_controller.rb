class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    loan = Loan.new loan_params
    loan.user_id = @current_user.id
    loan.save
    # raise 'hell'
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
    # redirect_to login_path unless @loan.user_id == @current_user.id
  end

  def update
    @loan = Loan.find params[:id]
    # redirect_to login_path unless @loan.user_id == @current_user.id
    @loan.update loan_params
    redirect_to loan_path(@loan.id)
  end

  def destroy
    Loan.destroy params[:id]
    redirect_to login_path unless @loan.user_id == @current_user.id
    redirect_to loans_path
  end

  private
  def loan_params
    params.require(:loan).permit(:user_id, :game_id, :start_date, :end_date, :status)
  end

end
