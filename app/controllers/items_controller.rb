class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
    @item.images.new
    @categories = ["選択してください"]
      Category.where(ancestry: nil).each do |parent|
        @categories << parent.name
      end  
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new
    end
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
      params.require(:item).permit(:name, :description, :category_id, :condition, :shippingpayer, :postage, :shipping_day, images_attributes: [:src])
    end

  end
