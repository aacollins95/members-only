class ApplicationController < ActionController::Base
  def digest(token)
    Digest::SHA1.hexdigest(token)
  end

  def sign_in(user)
    remember_token = SecureRandom.urlsafe_base64
    remember_digest = digest(remember_token)
    user.update_attribute(:remember_digest, remember_digest)
    cookies.permanent[:remember_token] = remember_token
    current_user
  end

  def current_user
    if cookies.permanent[:remember_token]
      remember_token = cookies.permanent[:remember_token]
      @current_user ||= User.find_by(remember_digest: digest(remember_token))
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out(user)
    user.update_attribute(:remember_digest, nil)
    cookies.delete :remember_token
  end

  def logged_in?(user)
    
    !!@current_user
  end

end
