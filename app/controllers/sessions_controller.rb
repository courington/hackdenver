class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    @session = Session.new
  end

  def create
    if not params[:session].blank?
      if not User.find_by_email(params[:session][:email]).present?
        user = User.create(:email => params[:session][:email], :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name)
        session[:user_id] = user.id
        redirect_to root_path
      else
        user = User.find_by_email(params[:session][:email])
        session[:user_id] = user.id
        redirect_to root_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

end