class UploadsController < ApplicationController
  before_filter :authenticate_user!
  
  include Transloadit::Rails::ParamsDecoder

  def index; end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(user: current_user, title: params[:upload][:title])
    
    if params[:transloadit] && params[:transloadit][:ok] == "ASSEMBLY_COMPLETED"
      @upload.s3_url = params[:transloadit][:results][":original"].first[:ssl_url] rescue nil
    end
    
    if @upload.save
      flash.notice = "Your document has been created!"
      redirect_to documents_path
    else
      flash.alert = ("<ul>%s</ul>" % @upload.errors.full_messages.inject("") { |string, message| string + ("<li>%s</li>" % message) }).html_safe
      redirect_to new_upload_url
    end
  end
  
  def destroy; end
end
