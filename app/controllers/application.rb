# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  def authorize
    unless session[:user_id]
      flash[:notice] = "You must log in before you can access the Admin Section"
      redirect_to(:controller => "login", :action => "login")
    end
  end
  
end