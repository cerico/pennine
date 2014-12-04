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
  
end
