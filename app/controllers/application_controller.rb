class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :autologin

  helper_method :current_user

  protected

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  private

  def autologin
    unless session.key?(:user_id)
      fn = Faker::Name.first_name
      ln = Faker::Name.last_name
      em = Faker::Internet.email(fn)

      user = User.create!({
        first_name: fn,
        last_name: ln,
        email: em
      })
      session[:user_id] = user.id
    end
  end

end
