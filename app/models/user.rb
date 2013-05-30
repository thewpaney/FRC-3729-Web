class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :pass, :credentials
  validates :first, :last, :email, :pass, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create
  serialize :credentials, Hash


  def full
    "#{self.first} #{self.last}"
  end
  
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
  
  def attending(event)
    response = event.attendance[email][0]
    marked = event.attendance[email][1]
    (response and not event.past?) or (event.past? and marked)
  end

  def response(event)
    response = event.attendance[email][0]
    if response == false
      return "Not attending"
    elsif response == true
      return "Attending"
    else
      return "Hasn't Replied"
    end
  end


  has_many :blog_post

end
