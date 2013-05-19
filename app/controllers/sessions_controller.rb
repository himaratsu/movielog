class SessionsController < ApplicationController
  def new
  end

  #
  #== create session when user succeed in "login"
  #
  def create  
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"  
    end  
  end  

  #
  #== destroy session when user select "logout" action
  #
  def destroy  
    session[:user_id] = nil  
    redirect_to root_url
  end  
end
