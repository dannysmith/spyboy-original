class Subscriber < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, 
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :message => "Pleast check your email address is correct."
end
