class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
     redirect_to root_url, :alert => "Sorry"
  end
  helper_method :authorize
  
  
  private
  
  def authorize
    if current_user.customer?
      redirect_to root_url
    end
  end
  
  
end
