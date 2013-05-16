class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  #
  #== セッションからユーザの情報を取得する
  #
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end  

  # ビューから呼び出せるようにする
  helper_method :current_user 

end
