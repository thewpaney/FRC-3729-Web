class TeamMailer < ActionMailer::Base
  default from: "mailer@robotics.stratosphe.re"
  
  def welcome_email(user)
    @user = user
    @login_url = 'robotics.stratosphe.re/login'
    mail(:to => user.email, :subject => "Welcome to the Site, #{@user.first}! -- FIRST Team 3729")
  end

  def sunday_digest(user)
    @user = user
    @upcoming_events = Event.find(:all, :conditions => ["start_at between ? and ?", Date.today, Date.today + 7])
    mail(:to => user.email, :subject => "FIRST Team 3729 Sunday Digest")
  end

end
