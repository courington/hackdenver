class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  helper_method :current_user

  protected

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  private

  def require_login
    if not current_user
      flash[:notice] = 'Please log in'
      redirect_to :controller => :sessions, :action => :new
    end
  end

end
