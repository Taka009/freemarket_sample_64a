class TopController < ApplicationController
  def index
    @categories = Category.where(ancestry: nil)
    @items = Item.all
  end
end