require "digest/sha1"
class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :name, :password
  
  validates_uniqueness_of :name
  validates_presence_of :name, :password
  #validates entry
  
  def before_create
    self.hashed_password = User.hash_password(self.password)
  end
  def after_create
    @password = nil
  end
  
  before_destroy :dont_destroy_bob
  def dont_destroy_bob
    raise "You can't delete yourself, I'm afraid" if self.name == 'bob'
  end
  
  
  def self.login(name, password)
    hashed_password = hash_password(password || "")
    find(:first,
         :conditions => ["name = ? and hashed_password = ?",
                          name, hashed_password])
  end
  def try_to_login
    User.login(self.name, self.password)
  end
  
    
    
  #hashes password using SHA1.  
  private
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
