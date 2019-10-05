# frozen_string_literal: true

class CallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    set_role if @user.role.nil?
    sign_in_and_redirect(@user)
  end

  def set_role
    if user_is_mentor?
      @user.role = :mentor
    else
      @user.role = :mentee
    end
    @user.save!
  end

  def user_is_mentor?
    request.env["omniauth.params"]['role']&.to_sym == :mentor
  end

end
