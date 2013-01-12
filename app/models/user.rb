class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :pass, :credentials
  validates :first, :last, :email, :pass, presence: true
  serialize :credentials, Hash
  
  def self.authenticate(login, pass)
    where(pass: pass, email: login.downcase).first
  end

  # def create(params)
  #   u = User.new
  #   u.login = params[:login]
  #   u.pass = params[:pass]
  #   u.first = params[:first]
  #   u.last = params[:last]
  #   u.email = params[:email]
  #   u
  # end
  
  belongs_to :blog_post

end
