class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :user_login?
  protect_from_forgery with: :exception


  def user_login?

  #   驗證
    if(session[:user] == nil)
    #   未登入

    else
    #   已登入

    end

  end


end
