class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    @session = Session.new
  end

  def create
    if not params[:session].blank?
      if not User.find_by_email(params[:session][:email]).present?
        user = User.create(:email => params[:session][:email], :first_name => 'steve', :last_name => 'watkinson')
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