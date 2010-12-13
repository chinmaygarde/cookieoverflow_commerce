# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password
  before_filter :prepare_format
  
  private
  
  def is_mobile?
    if session[:go_mobile]
      session[:go_mobile] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  
  helper_method :is_mobile?
  
  def prepare_format
    session[:go_mobile] = params[:mobile] if params[:mobile]
    request.format = :mobile if is_mobile?
  end
end
