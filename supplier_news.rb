class SupplierNews
	attr_accessor :notice, :title, :author, :url, :date, :name	
	def initialize name
		@name = name
		@notice = []		
	end
	#Agregar las noticias a la instrancia de Supplier
	def add_news(data,name)
		data.each { |new_object| @notice.push(new_object)}
		@notice.sort! {|x,y| x.date <=> y.date } #Ordenamos por fecha
		show(name)#Vamos al metodo Mostrar
	end
	#Darle formato a la Hora
	def time(time)
   	timepo_format = Time.at(time)
  	puts "FECHA ".colorize(:red) +"#{timepo_format.day}/#{timepo_format.month}/#{timepo_format.year} #{timepo_format.hour}:#{timepo_format.min}"
	end
	#Mostrar pues
	def show(name)
		puts "++++++++++++++++++++++++++++++++++++++++++++++++++++".colorize(:blue)
		puts "||||||||||||||||||||||| HACK News ||||||||||||||||||".colorize(:yellow)
		puts "++++++++++++++++++++++++++++++++++++++++++++++++++++".colorize(:blue)
		(0..@notice.size-1).each do |index|
			puts "+++++++++++++++++++++++ #{name} +++++++++++++++++++++".colorize(:blue)
			puts "Titulo: ".colorize(:red) + @notice[index].title
			puts "....................................................".colorize(:yellow)
			puts "Autor: ".colorize(:red) + @notice[index].author
			puts "....................................................".colorize(:yellow)
			puts "URL: ".colorize(:red) + @notice[index].url
			puts "....................................................".colorize(:yellow)
			time(@notice[index].date)
			puts "+++++++++++++++++++++++ #{name} +++++++++++++++++++++".colorize(:yellow)
			puts "||||||||||||||||||||||||||||||||||||||||||||||||||||".colorize(:blue)
		end
		puts "Numero de Noticias #{@notice.size}"
		return
	end
end

