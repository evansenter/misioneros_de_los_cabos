class UploadsController < ApplicationController
  before_filter :require_authorized_user!
  
  include Transloadit::Rails::ParamsDecoder

  def index
    @uploads = Upload.order("created_at DESC").page(params[:page])
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = current_user.uploads.build(title: params[:upload][:title])
    
    if params[:transloadit] && params[:transloadit][:ok] == "ASSEMBLY_COMPLETED"
      @upload.s3_url = params[:transloadit][:results][":original"].first[:ssl_url] rescue nil
    end
    
    if @upload.save
      flash.notice = "Your document has been created!"
      redirect_to documents_path
    else
      render "new"
    end
  end
  
  def destroy; end
end
