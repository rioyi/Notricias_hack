
class MenuReply
  attr_accessor :supplier_raddit
  def self.news_select(reply = 0,name = "",url = "")
    case reply
#Seleccion del Proveedor
      when 1
        url = 'reddit.com/.json'
        name = 'Reddit'        
      when 2        
        url ='http://digg.com/api/news/popular.json'
        name = 'Digg'
      when 3
        url = 'http://mashable.com/stories.json'
        name = 'MASHABLE'
        #Api_uptake.parser_data(url)
    end
#Procesamiento de datos
      data = Api_uptake.parser_data(url)
      case reply
      when 1
        data_ready = Api_uptake.data_reddit(data) #Metodo de Extracción de data para reddit(unico)
      when 2
        data_ready = Api_uptake.data_digg(data) #Metodo de Extracción de data para digg(unico)
      when 3
        data_ready = Api_uptake.data_mashable(data) #Metodo de Extracción de data para mashable(unico)  
        end
        supplier = SupplierNews.new(name)
        supplier.add_news(data_ready,name)
  end
end
