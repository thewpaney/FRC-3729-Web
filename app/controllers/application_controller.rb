class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate! p
    session[:user] = p.nil? ? nil : User.authenticate(p[:login], p[:pass])
  end

end
