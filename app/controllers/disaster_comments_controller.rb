class DisasterCommentsController < ApplicationController
  before_action :find_disaster

def index
  @comments = @disaster.comments
end

def show
  @comment = @disaster.comments.find( params[:id] )
end

def new
  @comment = @disaster.comments.build
end

def create
  @comment = @disaster.comments.build( attendee_params )
  if @comment.save
    redirect_to disaster_path( @disaster )
  else
    render :action => :new
  end
end

def edit
  @comment = @disaster.comments.find( params[:id] )
end

def update
  @comment = @disaster.comments.find( params[:id] )

  if @comment.update( attendee_params )
    redirect_to disaster_path( @disaster )
  else
    render :action => :edit
  end

end

def destroy
  @comment = @disaster.comments.find( params[:id] )
  @comment.destroy

  redirect_to disaster_comments_url( @disaster )
end

protected

def find_disaster
  @disaster = Disaster.find( params[:disaster_id] )
end

def attendee_params
  params.require(:comment).permit(:description)
end
end
