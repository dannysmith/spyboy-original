class LinkerController < ApplicationController

  before_filter :authorize
  
  layout "admin"
  
  def index
    redirect_to :controller => "admin"
  end
  
  def add_link
    if request.get?
      @link = Link.new
    else
      @link = Link.new(params[:link])
      if @link.save
        flash[:notice] = "Your link had been added!"
        redirect_to :action => "list_links"
      end
    end
  end

  def delete_link
    link = Link.find(params[:id])
     link.destroy
     flash[:notice] = "The link has been removed!"
     redirect_to :action => "list_links"
  end
  
  def edit_link
      @link = Link.find(params[:id])
  end
  
  def update_link
  @link = Link.find(params[:id])
  if @link.update_attributes(params[:link])
    flash[:notice] = 'Your link has been updated in the database!'
    redirect_to :action => 'list_links'
  else
    render :action => 'edit_link'
  end
end

  def list_links
    @all_links = Link.find(:all)
    @count = 0
  end 
end
