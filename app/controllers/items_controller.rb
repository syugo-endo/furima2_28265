class ItemsController < ApplicationController
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

  # def destroy
  #   @item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  private
  def item_params
    params.require(:item).permit(:name, :category, :text, :condition, :price, :shipping_fee, :shipping_date, :ship_from)
  end
end
