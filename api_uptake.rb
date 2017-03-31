#PROCESAR EL JSON
class Api_uptake
		@@trans = ""
		@@data = []
		@@hash_data = Hash.new
	#Parseando ando
	def self.parser_data(url)
		json_web = RestClient.get(url)
		@@trans = JSON.parse(json_web.body)
	end
	#Procesando datos para Reddit
	def self.data_reddit(data)
		data["data"]["children"].each do |child|
			@@hash_data[:title] = child["data"]["title"]
			@@hash_data[:author] = child["data"]["author"]
			@@hash_data[:url] =	child["data"]["url"]
			@@hash_data[:date] =	child["data"]["created_utc"]
			@@data.push(Notice.new(@@hash_data[:title],@@hash_data[:author],@@hash_data[:url],@@hash_data[:date]))
		end
		@@data
	end
	#Procesando datos para Digg
	def self.data_digg(data)
		data["data"]["feed"].each do |child|
			@@hash_data[:title] = child["content"]["title_alt"]
			@@hash_data[:author] = child["content"]["author"]
			@@hash_data[:url] =	child["content"]["url"]
			@@hash_data[:date] =	child["date"]
			@@data.push(Notice.new(@@hash_data[:title],@@hash_data[:author],@@hash_data[:url],@@hash_data[:date]))
		end
		@@data
	end
	#Procesando datos para Mashable
	def self.data_mashable(data)
		plano = data["new"]+data["rising"]+data["hot"]
		plano.each do |child|
			@@hash_data[:title] = child["title"]
			@@hash_data[:author] = child["author"]
			@@hash_data[:url] =	child["link"]
			@@hash_data[:date] =	child["post_date"].to_i
			@@data.push(Notice.new(@@hash_data[:title],@@hash_data[:author],@@hash_data[:url],@@hash_data[:date]))
		end
		@@data
	end	
end