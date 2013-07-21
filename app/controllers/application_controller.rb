class ApplicationController < ActionController::Base

  before_filter :authenticate_user!


  protect_from_forgery
  include SessionsHelper

  def handle_unverified_request
    sign_out
    super
  end
end
