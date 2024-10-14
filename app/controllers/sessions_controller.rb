require 'uri'
require 'net/http'

class SessionsController < ApplicationController
  def new
    redirect_to pictures_path and return if logged_in?
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
    redirect_to pictures_path and return
  end

  def destroy
    session.delete :user_id
    redirect_to login_path and return
  end

  def callback
    request_params = {
      code: params[:code],
      grant_type: 'authorization_code',
      redirect_uri: 'http://localhost:3000/oauth/callback',
      client_id: Rails.application.credentials[:authorization][:client_id],
      client_secret: Rails.application.credentials[:authorization][:client_secret],
    }
    uri = URI.parse(Rails.application.credentials[:authorization][:token_endpoint])
    response = Net::HTTP.post_form(uri, request_params)

    access_token = JSON.parse(response.body)[:access_token]
    # puts JSON.parse(response.body) # debug
    session[:access_token] = access_token
    redirect_to pictures_path and return
  end
end
