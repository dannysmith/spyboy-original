class LoginController < ApplicationController

  before_filter :authorize, :except => :login
  layout "admin"
  
  def index
    redirect_to(:controller => "admin")
  end
  
  def add_user
    if request.get?
      @user = User.new
    else
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "User #{@user.name} has been added."
        redirect_to(:controller => 'admin')
      end
    end
  end
 # Checks whether a new user is beig created or a user is being edited.
 
  def login
    if request.get?
      session[:user_id] = nil
      @user = User.new
    else
      @user = User.new(params[:user])
      logged_in_user = @user.try_to_login
      if logged_in_user
        session[:user_id] = logged_in_user.id
        redirect_to(:controller => "admin")
      else
        flash[:notice] = "Sorry, Invalid user/password combination!"
      end 
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You've been logged out"
    redirect_to(:action => "login")
  end

  def delete_user
    id = params[:id]
    if id && user = User.find(id)
      begin
        user.destroy
        flash[:notice] = "User: #{user.name} has been deleted from the database"
      rescue
        flash[:notice] = "Sorry, you can't delete that user!"
      end
    end
    redirect_to(:action => :list)
  end
  
#Lists all of the Users
  def list
    @all_users = User.find(:all)
  end

end
