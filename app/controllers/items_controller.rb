class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
    @item.images.new
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end
  
  def create
    @item = Item.new(item_params)

    @item.save!
  end
  
  def get_category_grandchildren
    respond_to do |format|
      format.html
      format.json do
        @category_grandchildren = Category.find("#{params[:child_id]}").children
      end
    end
  end
  
  def search
      redirect_to root_path
    end

    private
    def item_params
      
      params.require(:item).permit(:name, :description, :category_id, :condition, :shippingpayerra, :postage, :shipping_day,:price ,images_attributes: [:image_url]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
    end

  end
