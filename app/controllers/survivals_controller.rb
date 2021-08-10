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
      redirect_to items_new_path
    else
      render 'new'
    end
  end

  def edit
    @survival = Survival.find(params[:id])
  end

  def update
    @survival = Survival.find(params[:id])

    if @survival.update(update_params)
      flash[:success] = "Profile Updated"
      redirect_to @survival
    else
      render 'edit'
    end
  end

  def index
    @survivals = Survival.all
  end

  def mark_infected
    @current_survival_id = params[:id]
    @survival = Survival.find_by(id: @current_survival_id)
    if @survival.isInfectedCount == nil
      @survival.isInfectedCount = 0
    end
    @infected_count = @survival.isInfectedCount + 1
    @survival.marked_infected_by = current_user.id
    @success = false

    if @survival.update_attribute(:isInfectedCount, @infected_count)
      @success = true
    end

    render json: {data: @success}
  end

  def survival_params
    params.require(:survival).permit(:avatar,:name,:email,:age,:gender,:password,:password_confirmation)
  end

  def update_params
      params.require(:survival).permit(:avatar)
  end
end
