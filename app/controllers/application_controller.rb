class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authorize

  private

  def authorize
    unless Rails.env.test?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['HTTP_USER'] && password == ENV['HTTP_PASS']
      end
    end
  end

end
