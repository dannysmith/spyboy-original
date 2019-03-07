class ListController < ApplicationController

  def index
    @future_gigs = Gig.future_items
    @isWelcomePage = false
  end
  
  def welcome
    @isWelcomePage = true
  end
end
