class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :destroy, :pay, :buy]
  before_action :set_categories, only: [:new, :show]
  before_action :set_card, only: [:show, :pay]

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
    if @card.blank?
      render 'show'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end
  end

  def buy
    @item.update(set_item)
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

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shippingpayer_id, :postage_id, :shipping_day_id,:price,images_attributes: [:image_url]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end

  def set_item
    params.permit().merge(buyer_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end

  def set_card
    @card = Credit.find_by(user_id: current_user.id)
  end
end
