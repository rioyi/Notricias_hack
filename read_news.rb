
class Notice
	#Objeto Noticia
	attr_accessor :title, :author, :url, :date
	def initialize (title,author,url,date)
		@title = title
		@author = author
		@date = date
		@url = url
	end
end