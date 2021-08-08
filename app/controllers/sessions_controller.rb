class SessionsController < ApplicationController
  def new
  end

  def create
    survival = Survival.find_by(email: params[:session][:email].downcase)
    if survival && survival.authenticate(params[:session][:password])
      log_in survival
      redirect_to survival
    else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
