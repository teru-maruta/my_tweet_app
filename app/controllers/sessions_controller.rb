class SessionsController < ApplicationController
  def new
    redirect_to :pictures and return if logged_in?
  end

  def create
    flash.clear

    notice = []
    identification = params[:identification]
    notice << 'ユーザーIDが未入力' if identification.blank?
    password = params[:password]
    notice << 'パスワードが未入力' if password.blank?

    if identification.present? && password.present?
      user = User.find_by(identification: params[:identification], password: params[:password])
      notice << 'ユーザーIDとパスワードが一致するユーザーが存在しない' if user.blank?
    end

    (flash.now[:notice] = notice.join) and return if notice.present?

    session[:user_id] = user.id
    redirect_to :pictures and return
  end

  def destroy
    session.delete :user_id
    redirect_to :login and return
  end
end
