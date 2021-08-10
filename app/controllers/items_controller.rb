class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.survival_id = current_user.id
    if @item.save
      flash[:success] = "Welcome to Zombie Apocalypse"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @find_user = params[:id]
      @item = Item.find_by(survival_id: @find_user)
      if !@item
        flash[:danger] = "Sorry, No items found"
        redirect_to survivals_path
      end
    else
      flash[:warning] = "Please sign up first!"
      redirect_to root_path
    end
  end

  def edit
    redirect_to root_path
  end

  def index
    redirect_to root_path
  end

  def items_params
    params.require(:item).permit(:fiji_water,:campbell_soup,:first_aid_pouch,:ak)
  end
end
