require 'view'
require 'gossip'

class Controller
 attr_accessor :view

 	def initialize
 		@view = View.new
 		
 	end

 	def create_gossip
 		#hash contenant l'auteur et la contenu du gossip
 		params = @view.create_gossip
 		tmp= Gossip.new(params[:author],params[:content])
 		tmp.save
 	end

 	def index_gossips
 		@view.index_gossips(Gossip.all)		
 	end

 	def delete_gossip
 		@view.delete_gossip(Gossip.all)
 	end

end