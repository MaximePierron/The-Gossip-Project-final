module SessionHelper

	 # current_user retourne le user correspondant au remember token.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

	def log_in(user)
		session[:user_id] = user.id
	end

	# remember comme son nom l'indique permet de se souvenir de la session du user.
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

    # Retourne vrai si le user en question est toujours loggé et faux sinon.
  def logged_in?
    !current_user.nil?
  end

  # Log out current_user.
  def log_out
  	forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

    # Oublie la session de user.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end