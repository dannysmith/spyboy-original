class SubscribersController < ApplicationController
 
  before_filter :authorize, :except => [:add_subscriber]
  layout "admin"

    def add_subscriber
        @subscriber = Subscriber.new(params[:subscriber])
        if @subscriber.save
          flash[:notice] = "Thanks, you've been added."
          redirect_to(:action => 'welcome', :controller => 'list')
        else
          flash[:notice] = "Please check your email is correct."
          redirect_to(:action => 'welcome', :controller => 'list')
        end
    end
    
    
    def index
        redirect_to :controller => "list"
    end
    
    def delete_subscriber
      subscriber = Subscriber.find(params[:id])
       subscriber.destroy
       flash[:notice] = "The subscriber <strong>#{subscriber.email}</strong> is no longer in the llist!"
       redirect_to :action => "list_subscribers"
    end

    def list_subscribers
      @all_subscribers = Subscriber.find :all, :order => "email asc"
    end
  
end
