class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    logger.info "Callback User Data======#{@user.inspect}"
    if @user.persisted?
      logger.inof "persisted User Data #{@user.inspect}"
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      logger.inof "Not persisted User Data======== #{@user.inspect}"
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      logger.info "Session facebook Data========#{session["devise.facebook_data"].inspect}"
      redirect_to new_user_registration_url
    end
  end
end