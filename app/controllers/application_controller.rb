class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  private

  def authorize
    if APP_CONFIG['perform_authentication']
      authenticate_or_request_with_http_basic do |username, password|
        username == APP_CONFIG['username'] && password == APP_CONFIG['password']
      end
    end
  end

end
