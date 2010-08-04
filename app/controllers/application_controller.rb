# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #~ ensure_application_is_installed_by_facebook_user
   include AuthenticatedSystem
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
     layout 'index'
    before_filter :set_facebook_session
    helper_method :facebook_session

end
