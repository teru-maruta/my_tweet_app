class PicturesController < ApplicationController
  def new
    redirect_to login_path and return unless logged_in?
  end

  def create
    redirect_to login_path and return unless logged_in?

    redirect_to pictures_path and return
  end

  def index
    redirect_to login_path and return unless logged_in?
    @pictures = current_user.pictures
  end
end
