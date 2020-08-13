class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: :show
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

  def edit
    @item = Item.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :text, :condition_id, :price, :shipping_fee_id, :shipping_date_id, :ship_from_id).merge(user_id: current_user.id)
  end
end
