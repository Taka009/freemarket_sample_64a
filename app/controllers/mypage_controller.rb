class MypageController < ApplicationController

  def index
    @categories = Category.where(ancestry: nil)
  end

  def destroy
    session[:keep_signed_out] = true
  end
  
end
