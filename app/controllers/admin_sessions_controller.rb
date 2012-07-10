class AdminSessionsController < ApplicationController

def new
end

def create

  logger.debug "------------------"
  logger.debug params[:password]
  logger.debug ENV["ADMIN_PASSWORD"]
  logger.debug params[:password].class
  logger.debug ENV["ADMIN_PASSWORD"].class
  logger.debug params[:password] == ENV["ADMIN_PASSWORD"]
  logger.debug "------------------"

  if params[:login] == "admin" && params[:password] == ENV["ADMIN_PASSWORD"]
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
