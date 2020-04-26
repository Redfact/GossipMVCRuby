require 'colorize'

class View
	def initialize
		
	end

	def create_gossip
		puts "Veuiller saisir l'auteur"
		author = gets.chomp
		puts "Ecrivez le contenu de votre potin"
		content = gets.chomp
		#return un hash des deux valeurs recupérer (author,content)
		return params={content:content,author:author}
	end

	#Affiche le contenu de data qui est un array 2D
	def index_gossips(data)
		data.each{ |val|
			print val.author.colorize(:blue)," ",val.content.colorize(:light_yellow) ,"\n"
		}
	end

	def delete_gossip(data)
		puts "Choisir un gossip a supprimer".colorize(:green)
		data.each_index{ |i|
			print i.to_s.colorize(:light_yellow),": ",data[i].author," ",data[i].content,"\n"
		}
		index = gets.chomp.to_i
		if((0..data.size-1).include?(index))then 
			data.delete_at(index)
		else 
			system "clear"
			puts "Erreur dans le choix d'index".colorize(:light_red)
			delete_gossip(data)
		end 
		system "clear"
		data.each_index{ |i|
			print i.to_s.colorize(:light_yellow),": ",data[i].author," ",data[i].content,"\n"
		}
		Gossip.update(data)
	end
end