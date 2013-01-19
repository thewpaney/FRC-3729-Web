class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :pass, :credentials
  validates :first, :last, :email, :pass, presence: true
  serialize :credentials, Hash
  
  def self.authenticate(login, pass)
    where(pass: pass, email: login.downcase).first
  end

  # Returns true if "admin" or "master" keys are present and true
  def admin?
    (self.credentials.has_key?(:master) and self.credentials[:master]) or (self.credentials.has_key?(:admin) and self.credentials[:admin])
  end

  def member?
    self.credentials.has_key?(:member) and self.credentials[:member]
  end

  def nice_credentials
    (c = "#{credentials.collect {|c, v| v ? c : nil}.delete_if {|c| c.nil? }.join(', ')}") == "" ? "None!" : c
  end
  
  belongs_to :blog_post

end
