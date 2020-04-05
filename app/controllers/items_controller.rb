class ItemsController < ApplicationController
  def index
  end
  
  def new
    @image = Image.new
    @item = Item.new
    @category = Category.new
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
    @category = Category.create(category_params)
    @category.save!    
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
      params.require(:item).permit(:name, :desciription, :condition, :shippingpayer, :postage, :shipping_day)
    end

    def category_params
      params.require(:category).permit(:brand, :name, :path)
    end
  end
