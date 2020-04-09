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

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_id]}", ancestry: nil).children
 end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def search
      redirect_to root_path
    end

    private
    def item_params
      
      params.require(:item).permit(:name, :description, :category_id, :condition_id, :shippingpayer_id, :postage_id, :shipping_day_id,:price_id ,images_attributes: [:image_url]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
    end

  end
