class SessionController < ApplicationController
  def new
  end

  def create
    user= User.find_by contact: params[:contact]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end

    def destroy
      session[:user_id]=nil
      redirect_to login_path
    end



end
