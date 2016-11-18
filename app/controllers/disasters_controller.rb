class DisastersController < ApplicationController
  before_action :set_disaster, :only => [ :show, :edit, :update, :destroy]

  def index 
    @disasters = Disaster.all
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(disaster_params)
    if @disaster.save
      redirect_to disasters_path
      flash[:notice] = "disaster event was successfully created"
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @disaster.update(disaster_params)
      redirect_to disaster_path(@disaster)
      flash[:notice] = "disaster event was successfully updated"
    else
      render :action => :edit
    end
  end

  def destroy
    @disaster.destroy
    redirect_to :action => :index
    flash[:alert] = "disaster event was successfully deleted"
  end

  private

  def disaster_params
    params.require(:disaster).permit(:title, :content)
  end

  def set_disaster
    @disaster = Disaster.find(params[:id])
  end

end
