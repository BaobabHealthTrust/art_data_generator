class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :authenticate_user!
  #before_filter :check_login_status, except: [:login]
  #respond_to :html, :json
=begin
  protected 

  def check_login_status
  	if current_user.blank?
  		super
  	else

  	end
  end
=end
end
