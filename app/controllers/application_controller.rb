class ApplicationController < ActionController::Base
  # ログイン前はトップページ以外にアクセスしてもログイン画面にリダイレクト
  # before_action :authenticate_user!,except: [:top]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(@user) # ログイン後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end

Refile.secret_key = '003673c3dbee64d7fc711edde3f618b7b4b59edf5c301ec65c524a58ac53a648da9676152ce4aa79c7b124ca99237683502191a19a9cbc005527101887947906'
