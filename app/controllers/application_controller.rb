class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_editor
    redirect_to '/' unless current_user.editor?
  end

  def require_login
    redirect_to '/login' unless current_user
  end

end
