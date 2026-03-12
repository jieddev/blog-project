class Users::OmniauthCallbacksController < ApplicationController
  def google_oauth2 
    @user = User.from_google(from_omniauth)

    if @user.persisted?
      sign_in_and_redirect @user, notice: "Logged in successfully"
      
    else 
      redirect_to new_user_registration_url
    end

  end

  def failure
    redirect_to root_path, notice: "Authentication failed. Please try again."
  end

  def passthru
    
  end

  private 
  
  def from_omniauth
    request.env["omniauth.auth"]
  end


end
