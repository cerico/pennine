class OmniauthCallbacksController < ApplicationController
   def google_oauth2
     @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)
     if @user.persisted?
       flash[:notice] = "Scenic, find somewhere new to go today!"
       sign_in(@user)
       redirect_to trails_path, event: :authentication
     else
       session["devise.google_data"] = request.env['omniauth.auth']
       redirect_to new_user_registration_path
     end
  end
  
  def twitter
    @user = User.find_for_twitter(request.env['omniauth.auth'].except("extra"), current_user)

    if @user.persisted?
      flash[:notice] = "Welcome to the contacts App! You have successfully logged in with Twitter!"
      sign_in(@user)
      redirect_to trails_path, event: :authentication
    else
      session["devise.twitter_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to new_user_registration_path
    end
  end
  
end
