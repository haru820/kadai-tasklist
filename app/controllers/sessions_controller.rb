class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    if login(email,password)
      flash[:success] = 'Hi!! Welcome back here!!!'
      redirect_to root_url
    else
      flash.now[:danger] = 'Ops,,,, Failed!!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Bye. See you again!'
    redirect_to root_url
  end
  
  private
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      #Login
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
