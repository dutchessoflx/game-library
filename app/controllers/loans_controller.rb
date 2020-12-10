class LoansController < ApplicationController
  def new
    @loan = Loan.new
    @loans = Loan.all
  end

  def create
    loan = Loan.create loan_params
    loan.user_id = @current_user.id
    if loan.game.available? == false
      redirect_to new_loan_path
      flash[:error] = "That Game is unavailable at this time"
    else
      loan.save
      redirect_to loans_path
    end
  end

  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find params[:id]
  end

  def edit
    @loan = Loan.find params[:id]
    redirect_to login_path unless @loan.user_id == @current_user.id
  end

  def update
    @loan = Loan.find params[:id]
    redirect_to login_path unless @loan.user_id == @current_user.id
    @loan.update loan_params
    redirect_to loan_path(@loan.id)
  end

  def destroy

    if @loan.user.id == @current_user.id
      @loan = Loan.destroy params[:id]
    redirect_to loans_path
    else
      flash[:error] = "You must be the user to delete a loan"
    redirect_to login_path
    end

  end

  private
  def loan_params
    params.require(:loan).permit(:user_id, :game_id, :start_date, :end_date)
  end

end
