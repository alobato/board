class AdminSessionsController < ApplicationController

def new
end

def create

    puts "------------------"
    puts params[:password]
    puts ENV["ADMIN_PASSWORD"]
    puts params[:password].class
    puts ENV["ADMIN_PASSWORD"].class
    puts params[:password] == ENV["ADMIN_PASSWORD"]
    puts "------------------"

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
