class LikesController < ApplicationController
	def new	
		# Pour revenir au gossip sur lequel on ajoute un like
		@gossip = Gossip.find(params[:gossip_id]) 
    # Pour ajouter un like
    @like = Like.new
  end

  def create		
  	@gossip = Gossip.find(params[:gossip_id])
  	@like = Like.create(user: current_user, gossip: @gossip)

    # request.referrer donne la page en cours en d'autre termes on rafraîchit la page pour afficher l'ajout de like
    redirect_to request.referrer
  end

  def edit		
  end

  def update		
  end

  def destroy
  	@gossip = Gossip.find(params[:gossip_id])
  	@like = Like.find(params[:id])
 		
 		@like.destroy
  	redirect_to request.referrer
  end
end
