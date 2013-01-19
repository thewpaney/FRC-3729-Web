class TeamMailer < ActionMailer::Base
  default from: "mailer@robotics.stratosphe.re"
  
  def welcome_email(user)
    @user = user
    @login_url = 'robotics.stratosphe.re/login'
    mail(:to => user.email, :subject => "Welcome to the Site, #{@user.first}! -- FIRST Team 3729")
  end

end
