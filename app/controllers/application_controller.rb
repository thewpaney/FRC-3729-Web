class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate! p
    session[:user] = p.nil? ? nil : User.authenticate(p[:login], p[:pass])
  end

  def login_required!
    return true if session[:user]
    flash[:error] = 'You must log in to continue.'
    redirect_to :controller => 'users', :action => 'login'
    false
  end


end
