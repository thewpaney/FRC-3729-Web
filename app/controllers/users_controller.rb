class UsersController < ApplicationController
  layout "innerpage"

  def login
    self.authenticate! params[:user]
    if !session[:user].nil?
      flash[:message]  = "You're logged in as #{session[:user].first} #{session[:user].last}."
      redirect_to "/blog"
    elsif request.post?
      flash[:error] = "Login failed."
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      TeamMailer.welcome_email(@user).deliver
      flash[:message] = "User successfully created!"
      redirect_to @user
    else
      flash[:error] = "Could not create user."
      redirect_to '/users/new'
    end

  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def logout
    unless session[:user].nil?
      session[:user] = nil
      flash[:message] = 'Successfully logged out.'
    else
      flash[:error] = "You're not currently logged in!"
    end
    redirect_to '/blog'
  end
  

end
