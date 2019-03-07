class Gig < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url, :price, :venue, :date, :time,
                        :message => "musn't be left blank. Please enter some data."
                        
  validates_format_of :image_url, :image2_url,
                      :with => %r{^.+\.(gif|jpg|jpeg|png)$}i,
                      :message => "must point to a valid GIF JPG or PNG image on a webserver."
                      
  def self.future_items
    find(:all, :conditions => ["date >= ?", 8.hours.ago], :order => "date ASC")    
    #The 8 hours is to allow for the time difference on the Dreamhost servers.
  end
  
  
end
