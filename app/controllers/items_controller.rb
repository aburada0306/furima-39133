class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :show, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless (current_user.id == @item.user_id) && @item.order.blank?
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    end
    redirect_to root_path 
  end
  private
  def item_params
    params.require(:item).permit(:title, :price, :content,:postage_id,:category_id,:status_id, :prefecture_id,:delivery_id,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
