class SellController < ApplicationController
  def sell
    @categories= Category.where(ancestry: nil)
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def get_category_grandchildren
    respond_to do |format|
      format.html
      format.json do
        @category_grandchildren = Category.find("#{params[:child_id]}").children
      end
    end
  end

  def new
    # @image = Image.new
    @item = Item.new
    @category = Category.new
    @conditinon = Condition.new
    @postage = Postage.new
  end

  def create
    
    # @image = Image.create
    # @image.save!
    @item = Item.create(item_params)
    @item.save!
    # item
    
    @category = Category.create(category_params)
    @category.save!
    # category
    @condition = Condition.create(condition_params)
    @condition.save!
    # condition
    @postage = Postage.create(postage_params)
    @postage.save!
    #  postage
    redirect_to 'sell/sell'
    
  end

  def search
    
  end
  

private
  def item_params
    params.require(:item).permit(:name, :desciription)
  end

  def category_params
    params.require(:category).permit(:brand, :name, :path)
  end

  def condition_params
    params.require(:condition).permit(:condition)
  end

  def postage_params
    params.require(:postage).permit(:way_to_pay, :how_to_send, :Delivery_days)
  end


end
