class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 下記before_action効かすと、ログインしてない状態だと、どんなリクエストでもログインページに飛ばされる(ルートパスリクエストしてもトップに飛べないので無効化中)
  # before_action :authenticate_user!



  def after_sign_out_path_for(resource)
    root_path 
    # ログアウト後に遷移するpathを設定(デフォルトはログインページへのパス)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :kana_last_name, :kana_first_name, :birth_date])
  end
end