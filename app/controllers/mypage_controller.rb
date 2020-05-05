class MypageController < ApplicationController

  def index
  end

  def destroy
    session[:keep_signed_out] = true
  end

end
