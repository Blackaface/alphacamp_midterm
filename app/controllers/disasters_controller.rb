class DisastersController < ApplicationController
  def index 
    @disasters = Disaster.all
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(disaster_params)
    @disaster.save

    redirect_to disasters_path
  end

  def show
    @disaster = Disaster.find(params[:id])
  end

  def edit
    @disaster = Disaster.find(params[:id])
  end

  def update
    @disaster = Disaster.find(params[:id])
    @disaster.update(disaster_params)

    redirect_to disaster_path(@disaster)
  end

  def destroy
    @disaster = Disaster.find(params[:id])
    @disaster.destroy

    redirect_to :action => :index
  end

  private

  def disaster_params
    params.require(:disaster).permit(:title, :content)
  end

end
