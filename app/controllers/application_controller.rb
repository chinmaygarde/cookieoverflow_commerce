# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password
  before_filter :prepare_format
  
  private
  
  def is_mobile?
    request.user_agent =~ /Mobile|webOS/
  end
  
  helper_method :is_mobile?
  
  def prepare_format
    request.format = :mobile if is_mobile?
  end
end
