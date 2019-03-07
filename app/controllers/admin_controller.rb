class AdminController < ApplicationController

  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end

  def list
    @gigs = Gig.find(:all, :order => "date desc")
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(params[:gig])
    if @gig.save
      flash[:notice] = 'Your show has been added to the database!'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @gig = Gig.find(params[:id])
    
  end

  def update
    @gig = Gig.find(params[:id])
    if @gig.update_attributes(params[:gig])
      flash[:notice] = 'Your show has been updated in the database!'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Gig.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end


