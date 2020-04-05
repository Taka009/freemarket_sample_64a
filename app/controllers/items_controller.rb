class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
    @item.images.new
    @categories= Category.where(ancestry: nil)
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
          end
        end
      end
  
  def create
    @item = Item.create(item_params)
    @item.save!
    redirect_to root_path 
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
      params.require(:item).permit(:name, :description, :category, :condition, :shippingpayer, :postage, :shipping_day, images_attributes: [:image_url])
    end

  end
