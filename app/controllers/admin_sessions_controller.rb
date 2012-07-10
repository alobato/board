class AdminSessionsController < ApplicationController

def new
end

def create
  if params[:login] == APP_CONFIG['username'] && params[:password] == APP_CONFIG['password']
    session[:user_id] = 1
    redirect_to root_url, notice: "Logged in!"
  else
    flash.now.alert = "Email or password is invalid"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out!"
end

end
