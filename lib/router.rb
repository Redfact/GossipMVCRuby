require 'controller'
require 'colorize'

class Router
 attr_accessor :controller

	def initialize
		@controller= Controller.new
	end

	def perform
		print "".center(5)
		puts "Bienvenure dans Gossip project !\n".colorize(:light_yellow)
		while true
		puts "a : Creer un gossip"
		puts "b : Afficher gossip"
		puts "c : Supprimer gossip"
		puts "q : Quitter l'app"

		input = gets.chomp
		system "clear"
			case input
				when "a"
					puts "creation de gossip"
					@controller.create_gossip
				when "b"
					@controller.index_gossips				
				when "c"
					puts "Suppression de gossip"
					@controller.delete_gossip
				when "q"
					puts "Vous avez quitté l'app".colorize(:light_red)	
					break
				else puts "Vous n'avez pas saisis la bonne commande".colorize(:light_red)		
			end
		end 	
	end

end 