class SessionsController < ApplicationController
  
  def new
  end
  
  def create  
    user = User.authenticate(params[:email], params[:password])  
    
    if user  
      session[:user_id] = user.id
      redirect_to "/", :notice => "Welcome back #{user.name}"  
    else
      flash[:notice] = 'Invalid Email or Password'
      render "new"
    end  
  end
  
  def destroy  
    session[:user_id] = nil  
    redirect_to "/login", :notice => "Logged Out"  
  end
  
end
