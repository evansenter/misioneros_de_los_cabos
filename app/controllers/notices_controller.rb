class NoticesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @notices = Notice.order("created_at DESC").page(params[:page])
  end
  
  def show; end
  
  def new
    @notice = Notice.new
  end
  
  def create
    @notice = current_user.notices.build(notice_params)
    
    if @notice.save
      redirect_to @notice
    else
      render "new"
    end
    
  end
  
  def edit; end
  
  def update
    if @notice.update(notice_params)
      redirect_to @notice
    else
      render "edit"
    end
  end
  
  def destroy
    @notice.destroy
    flash.notice = "The notice has been permanently deleted."
 
    redirect_to notices_path
  end
  
  private
  
  def find_post
    @notice = Notice.find(params[:id])
  end
  
  def notice_params
    params.require(:notice).permit(:title, :body)
  end
end
