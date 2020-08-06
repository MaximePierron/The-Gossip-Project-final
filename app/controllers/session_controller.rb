class SessionController < ApplicationController
	def new
	end

	  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Mauvais mot de passe ou mauvaise adresse email'
      render 'new'
    end
  end

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end
end
