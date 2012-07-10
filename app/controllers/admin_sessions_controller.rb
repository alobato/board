class AdminSessionsController < ApplicationController

def new
end

def create

  logger.info "------------------"
  logger.info params[:password]
  logger.info ENV["ADMIN_PASSWORD"]
  logger.info params[:password].class
  logger.info ENV["ADMIN_PASSWORD"].class
  logger.info params[:password] == ENV["ADMIN_PASSWORD"]
  logger.info "------------------"

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
