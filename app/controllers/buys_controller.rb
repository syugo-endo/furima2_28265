class BuysController < ApplicationController
  def done
    @item_purchaser = Item.find(params[:id])
    @item_purchaser.upedate(user_id: current_user.id)
  end
end
