class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :pass, :credentials
  validates :first, :last, :email, :pass, presence: true
  serialize :credentials, Hash
  
  def self.authenticate(login, pass)
    where(pass: pass, email: login.downcase).first
  end

  # Returns true if "admin" or "master" keys are present and true
  def admin?
    self.credentials[:master] or  self.credentials[:admin]
  end

  def member?
    self.credentials[:member]
  end

  def blog_access?
    self.credentials[:blog] or self.credentials[:admin] or self.credentials[:master]
  end

  def nice_credentials
    (c = "#{credentials.collect {|c, v| v ? c : nil}.delete_if {|c| c.nil? }.join(', ')}") == "" ? "None!" : c
  end
  
  belongs_to :blog_post

end
