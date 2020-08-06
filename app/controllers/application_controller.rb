class ApplicationController < ActionController::Base

	include SessionHelper

	private

	def authenticate_user
		unless current_user
			flash[:error] = "Connectez-vous s'il-vous-plaît."
			redirect_to session_new_path
		end
	end

end
