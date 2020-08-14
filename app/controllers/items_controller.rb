class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: :show, :edit, :destroy, :update
  def index
    @items = Item.all.order('created_at DESC')
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

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item)
    else
      render :edit
    end
  end


  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :text, :condition_id, :price, :shipping_fee_id, :shipping_date_id, :ship_from_id).merge(user_id: current_user.id)
  end
end
