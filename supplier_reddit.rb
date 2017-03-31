require_relative 'supplier_news'

class RedditNews < SupplierNews

@news = []
	def initilize(name,url)
		@name = name
		@url = url

	end

	def self.create(name,url)
		 #@title
		@@news.puss (MenuReply.news_select(name,url))
	end

	def self.show 
		print @@news
	end
end