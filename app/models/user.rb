class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :pass, :credentials
  validates :first, :last, :email, :pass, presence: true
  serialize :credentials, Hash
  
  def self.authenticate(login, pass)
    where(pass: pass, email: login.downcase).first
  end
  
  belongs_to :blog_post

end
