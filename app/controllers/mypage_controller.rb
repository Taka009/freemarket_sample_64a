class MypageController < ApplicationController

  before_action :authenticate_user!

  def index
    @categories = Category.where(ancestry: nil)
    @users = current_user.id
    @users = User.select("nickname")
    @items = Item.all
  end

  def destroy
    session[:keep_signed_out] = true
  end

end
