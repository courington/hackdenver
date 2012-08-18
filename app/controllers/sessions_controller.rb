class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    @session = Session.new
  end

  def create
    if not params[:session].blank?
      if not User.exists?(['email = ?', params[:session][:email]])
        user = User.create(:email => params[:session][:email])
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to :action => :new
      end
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

end