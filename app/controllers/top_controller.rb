class TopController < ApplicationController
  def index
    @categories = Category.eager_load(children: :children).where(parent_id: nil) 
    @items = Item.all
  end
end