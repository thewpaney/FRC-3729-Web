class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :login, :pass, :credentials
  validates :login, :first, :last, :email, :pass, presence: true
  validates :login, uniqueness: true
  serialize :credentials, Hash
  
  def self.authenticate(login, pass)
    where(pass: pass, login: login.downcase).first
  end
  
  belongs_to :blog_post

end
