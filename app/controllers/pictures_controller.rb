class PicturesController < ApplicationController
  def new
    redirect_to login_path and return unless logged_in?
  end

  def create
    redirect_to login_path and return unless logged_in?

    # insert
    title = params[:title]
    file_uuid = SecureRandom.uuid
    Picture.create(user: current_user, title:, file_name: file_uuid)
    # ファイル配置
    file = params[:file]
    File.binwrite("public/uploads/#{file_uuid}", file.read)

    redirect_to pictures_path and return
  end

  def index
    redirect_to login_path and return unless logged_in?
    @pictures = current_user.pictures
  end
end
