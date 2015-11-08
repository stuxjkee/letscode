class AdminController < ApplicationController
  def index
    redirect_to '/' unless current_user.editor?
  end
end
