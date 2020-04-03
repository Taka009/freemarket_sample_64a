class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.save!

    redirect_to root_path 
  end

private
  def item_params
    params.require(:item).permit(:name, :desciription)
  end
end
