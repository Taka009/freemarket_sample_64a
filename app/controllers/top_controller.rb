class TopController < ApplicationController
  def index
    @categories = Category.all.order("id ASC").limit(2)
    @items = Item.all
  end
end