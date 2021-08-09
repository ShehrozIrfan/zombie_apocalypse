class SurvivalsController < ApplicationController

  def show
    if logged_in?
      if correct_user
        @survival = Survival.find(params[:id])
      end
    else
      redirect_to root_path
    end
  end
  def new
    if !logged_in?
      @survival = Survival.new
    else
      redirect_to root_path
    end
  end

  def create
    @survival = Survival.new(survival_params)

    if @survival.save
      log_in @survival
      flash[:success] = "Welcome to Zombie Apocalypse"
      redirect_to @survival
    else
      render 'new'
    end
  end

  def survival_params
    params.require(:survival).permit(:avatar,:name,:email,:age,:gender,:password,:password_confirmation)
  end
end
