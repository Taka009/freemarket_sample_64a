class TopController < ApplicationController
  def index
    @categories = Category.where(ancestry: nil)
    @items = Item.where(buyer_id: nil)
  end
end