class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :pay, :buy,:purchase,:edit,:update]
  before_action :set_categories, only: [:new, :show,:purchase]
  before_action :set_card, only: [:pay,:purchase]

  def index
  end
  
  def new
    @category_parent_array = Category.where(ancestry: nil).pluck(:id,:name)
    
    @item = Item.new
    @item.images.new
    
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def get_category_children
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
 
  def search
      redirect_to root_path
  end

  def purchase
    @parents = @item.category.parent
    @category = @parents.parent
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
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
    @item.update(buyer_params)
    if @item.save
      redirect_to root_path, notice: "購入しました"
    else
      redirect_to root_path, alert: "購入に失敗しました"
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
    redirect_to action: "buy"
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shippingpayer_id, :postage_id, :shipping_day_id, :price, images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end

  def set_card
    @card = Credit.find_by(user_id: current_user.id)
  end

  def buyer_params
    params.permit().merge(buyer_id: current_user.id)
  end
end
