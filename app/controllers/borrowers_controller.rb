class BorrowersController < ApplicationController
  def new
    @borrower = Borrower.new
  end

  def create

  end

  def index
    @borrowers = Borrower.all
  end

  def show
    @borrower = Borrower.find params[:id]
  end

  def edit
    @borrower = Borrower.find params[:id]
  end

  def update
  end

  def destroy
    Borrower.destroy params[:id]
    redirect_to borrowers_path
  end
end
