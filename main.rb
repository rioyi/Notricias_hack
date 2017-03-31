#FILES
require 'colorize'
require_relative 'menu_reply'
require_relative 'api_uptake'
require_relative 'supplier_news'
require_relative 'read_news'

#GEMS
require 'rest-client'
require 'json'

	def show(reply)
		puts MenuReply.news_select(reply)
	end


	def main
		reply = 0

		loop do
			puts "Centro de Noticias Hack RSS"
			puts "Ingres cual noticia desea revisar"
			puts "1.Reddit"
			puts "2.Digg"
			puts "3.Mashable"
			reply  = gets.chomp.to_i
			if reply > 3 || reply.class == String
				puts "Numero Equivocado".colorize(:red)
			end
			puts
			break if reply <= 3 && reply.class == Integer
		end
		show(reply)
	end
main()

