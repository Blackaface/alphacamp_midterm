class DisasterCommentsController < ApplicationController
  before_action :find_disaster
  before_action :find_own_commment, :only => [:edit, :update, :destroy]
  # 未排版
  def index
    @comments = @disaster.comments
  end

  def show
    @comment = @disaster.comments.find(params[:id])
  end

  def new
    @comment = @disaster.comments.build
  end

  def create
    @comment = @disaster.comments.build(attendee_params)
    if @comment.save
      flash[:notice] = "新增成功"
      redirect_to disaster_path(@disaster)
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @comment.update(attendee_params)
      flash[:notice] = "修改成功"
      redirect_to disaster_path(@disaster)
    else
      render :action => :edit
    end

  end

  def destroy
    @comment.destroy
    flash[:notice] = "刪除成功"
    redirect_to disaster_comments_url(@disaster)
  end

  protected

  def find_disaster
    @disaster = Disaster.find(params[:disaster_id])
  end

  def attendee_params
    params.require(:comment).permit(:description)
  end

  def find_own_commment
    @comment = current_user.comments.find(params[:id])
  end
end
