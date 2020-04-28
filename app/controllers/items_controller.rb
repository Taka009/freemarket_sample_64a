class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :destroy]
  before_action :set_categories, only: [:new, :show]

  def index
  end
  
  def new
    @category_parent_array = Category.where(ancestry: nil).pluck(:id,:name)
    
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
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def get_category_children
    @category_children = Category.find_by("#{params[:parent_id]}", ancestry: nil).children
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def search
      redirect_to root_path
  end

  def show
    @parents = @item.category.parent
    @category = @parents.parent
    @user = @item.user
    
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end
  end

  def buy
    item = Item.find(params[:id])
    item.update(buy_params)
    redirect_to root_path
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
      :amount => @item.price,
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
    redirect_to action: "buy"
  end

  private
  def item_params
    
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shippingpayer_id, :postage_id, :shipping_day_id,:price,images_attributes: [:image_url]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end

  def buy_params
    @item = Item.find(params[:id])
    params.permit(images_attributes: [:image_url],user_id: @item.user.id,seller_id: @item.user.id,name:@item.name,description:@item.description,category_id:@item.category.id,condition_id: @item.condition.id,shippingpayer_id: @item.shippingpayer.id, shippingpayer_id: @item.shippingpayer.id,  shipping_day_id: @item.shipping_day.id, price: @item.price).merge(buyer_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end
  
end
