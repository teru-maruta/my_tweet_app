require "uri"
require "net/http"

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

  def authorization
    endpoint = Rails.application.credentials[:authorization][:authorize_endpoint]
    query_params = {
      response_type: "code",
      client_id: Rails.application.credentials[:authorization][:client_id],
      redirect_uri: "http://localhost:3000/oauth/callback",
      scope: Rails.application.credentials[:authorization][:scope]
    }
    redirect_to("#{endpoint}?#{query_params.to_query}", allow_other_host: true) and return
  end

  def tweet
    picture = current_user.pictures.find(params[:picture])
    parameters = {
      text: picture.title,
      url: "http://localhost:3000/uploads/#{picture.file_name}"
    }
    headers = {
      "Content-Type": "application/json",
      Authorization: "Bearer #{session[:access_token]}"
    }
    uri = URI.parse(Rails.application.credentials[:authorization][:tweet_endpoint])
    response = Net::HTTP.post(uri, parameters.to_json, headers)
    # puts response.code # debug success: 201
    # puts response.body # debug
    redirect_to pictures_path and return
  end
end
