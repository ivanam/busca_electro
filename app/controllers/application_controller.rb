class ApplicationController < ActionController::Base
  
 def scrape_reddit
    require 'open-uri'
    require 'mechanize'
    require 'ostruct'


    #HABRIA Q PONER UNA IMAGEN DE DEFECTO SI NO LA ENCUENTRA!!!
    #la cantidad max de busqueda la podemos poner desde la vista
    #obtener nombre del producto desde la vista

    #doc = Nokogiri::HTML(open("https://www.mercadolibre.com.ar/" ,'User-Agent' => "Ruby/#{RUBY_VERSION}"	))

	# data = 'practice'
	# mechanize = Mechanize.new
	# page = mechanize.get('https://www.yogajournal.com/search?query=' + data)
	# puts page.title

	# page.css('article h2').each do |h3|
	# 	puts h3.text.strip
	# end

	# mechanize = Mechanize.new
	# page = mechanize.get('https://www.yogajournal.com')
	# form = page.forms.first
	# form['query'] = 'yoga'
	# page = form.submit

	# @all_image_urls = page.css('picture').select{|img| img[:src] if img[:width].to_i > 100}

 #    @entriesArray = []
 #    # page.css('article h2').each do |h3|
 #    #    @entriesArray << h3.text.strip
 #    # end


 ## COMPUMUNDO
 #.............................................................
 	#  mechanize = Mechanize.new
 	#  url = 'https://www.musimundo.com/'
	 # page = mechanize.get(url)
	 # form = page.forms.first
	 # form['text'] = 'notebook'
	 # page = form.submit
	 #ESTO ES PARA MANDAR AL INCLUDE DE ABAJO
	 #name.upcase
	 #name.upcase
	 #name

	 #@all_image_urls = page.css('img').select{|img| img[:src] if img[:width].to_i > 100}

    #  @entriesArray = []
    #  page.css('a img').each do |h3|
    #       if h3.attr('title') != nil  and h3.attr('title').include? 'NOTEBOOK'
    #      	 @entriesArray << h3.attr('src')
    #   	  end
    #   end

    #  @precios = []
    #  page.css('.mus-pro-price-number span').each do |h|
    #      	 @precios << h.text.strip
    #  end
    #  #HACER TUPLAS POR EJEMPLO (IMAGEN, PRECIO) PARA PODER MOSTRARLO
    #  cantidad = 0
    #  @entriesArray = []
    #  page.css('a').each do |a|
    #  	if a.attr('title')  != nil and a.attr('title').include? 'NOTEBOOK' and cantidad < 10
    #  	   cantidad = cantidad + 1
    #  	   producto = OpenStruct.new
    #  	   url_base = a.attr('href')
    #  	   producto.link = url + url_base
    #  	   a.css('img').each do |h3|
	   #         	if h3.attr('title') != nil  and h3.attr('title').include? 'NOTEBOOK'
	   #        	 	producto.url = h3.attr('src')
	   #     	  	end
    #    	   end
    #    	   a.css('.mus-pro-price-number span').each do |h|
    #       	  producto.precio = h.text.strip
    #        end
    #        producto.nombre = a.css('.mus-pro-name').text.strip
    #        producto.cuotas = a.css('.mus-pro-quotes').text.strip
    #        mechanize2 = Mechanize.new
		  #  url2 = producto.link
		  #  page2 = mechanize2.get(url2)
		  #  producto.info =page2.css('#general p').text
    #        @entriesArray << producto

    #    end
    # end




      
#..................MERCADO LIBRE...........................................
 	#  mechanize = Mechanize.new
	 # page2 = mechanize.get('https://www.mercadolibre.com.ar/')
	 # form = page2.forms.first
	 # form['as_word'] = 'notebook'
	 # page2 = form.submit



	 # #ESTO ES PARA MANDAR AL INCLUDE DE ABAJO
	 # #name.upcase
	 # #name.upcase
	 # #name

	 # #@all_image_urls = page.css('img').select{|im@all_image_urls = page.css('img').select{|img| ig| img[:src] if img[:width].to_i > 100}
	 # @entriesArray = []
	 # cantidad = 0
	 # listado = page2.css('section li.results-item')
	 # @result = []
	 # listado.each do |l|
	 # 	if cantidad < 10 and l.css('span.item-installments-text').text.include? ''
	 # 		 @result << l
	 # 		 producto = OpenStruct.new
		# 	 if l.css('a').attr('href')!= nil
		# 	 	 	producto.link = l.css('a').attr('href')
		# 	 	 	producto.nombre = l.css('a').css('span.main-title').text
		# 	 else
		# 	 	next
		# 	 end
		#      producto.precio = l.css('.price__fraction').text.strip
		#      if l.css('img').attr('data-src') != nil
	 #      	 	producto.url = l.css('img').attr('data-src').text
	 #      	 else
	 #      	 	producto.url = l.css('img').attr('src').text
	 #      	 end 
	 #      	 mechanize2 = Mechanize.new
		#      url2 = producto.link
		#      page2 = mechanize2.get(url2)
		#      producto.info =page2.css('section section').text
  #            @entriesArray << producto
	 #  	 	 cantidad = cantidad + 1
	 #  	else
	 #  		next
	 #  	end

	 # end


# if l.attr('title') != nil and titulo.size > 0 and l.attr('title').include? titulo
# 	 			if !l.css('img').any? and l.css('span').any?
# 	 				@entriesArray.each do |prod|
# 	 					if prod.nombre == titulo
# 	 						prod.precio_ant = l.css('span em.ListPrice').text
# 			 				prod.precio = l.css('span em.BestPrice').text
# 			 				cantidad = cantidad + 1
# 	 					end
# 	 				end
		 			
# 	 			end
	 			
# 	 	 	elsif l.attr('title') != nil and l.attr('title').include? 'Notebook' and l.css('img').any? and !l.css('span').any? and l.attr('href') != "" and titulo != l.attr('title')
	 			
# 	 			producto = OpenStruct.new
# 	 			titulo = l.attr('title')
# 	 			producto.nombre = l.attr('title')
# 	 			producto.link = l.attr('href')
# 	 			producto.url = l.css('img').attr('src')
# 	 			@entriesArray << producto
	 			
	 			
# 	 		end
# 	 listado_cuotas = page.css('ul li figure')
# 	 listado_cuotas.each do |ll|
# 	 	if ll.css('img').any? and ll.css('img').attr('src') != nil
# 	 		@entriesArray.each do |prod|
# 	 					if prod.url == ll.css('img').attr('src')
# 	 						cuotas = ll.css('p.flag').text
# 	 						if cuotas == "visa18sininteres"
# 	 							prod.cuotas = "18 cuotas sin interes con VISA"
# 	 						elsif "visa12sininteres"
# 	 							prod.cuotas = "12 cuotas sin interes con VISA"
# 	 						end
# 	 					end
# 	 		end
# 	 	end
# 	 end
		
# 	 			url2 = producto.link
# 				page2 = mechanize.get(url2)
# 				producto.info =page2.css('section section').text
	



  #-------------------------------------------------------
  #####CIBERMONDEY
  #     mechanize = Mechanize.new
	 # page = mechanize.get('https://www.cybermonday.com.ar/')
	 # form = page.forms.first
	 
	 # form['q'] = 'notebook'
	 # page = form.submit


     #-----------------------------------------------
     #

       #####CIBERMONDEY
  #    mechanize = Mechanize.new
  #    data = 'notebook'
	 # page = mechanize.get('https://www.fravega.com/'+ data)

	 #ESTO ES PARA MANDAR AL INCLUDE DE ABAJO
	 #name.upcase
	 #name.upcase
	 #name

	 # @entriesArray = []
	 # cantidad = 0
	 # titulo = ""
	 # listado = page.css('ul li a')
	 # listado.each do |l|
	 # 	if cantidad < 5 and 
	 		
	 # 		if l.attr('title').include? 'Notebook' and l.css('img').any? and l.attr('href') != "" and titulo != l.attr('title')
	 # 			titulo = l.attr('title')
	 # 			producto = OpenStruct.new
	 # 			producto.nombre = l.attr('title')
	 # 			producto.link = l.attr('href')	
	 # 			producto.precio_ant = l.css('span em.ListPrice').text
	 # 			producto.precio = l.css('span em.BestPrice').text
	 # 			producto.url = l.css('img').attr('src')
	 # 		# 	url2 = producto.link
		# 		# page2 = mechanize.get(url2)
		# 		# producto.info =page2.css('section section').text
	 # 			@entriesArray << producto
	 # 			cantidad = cantidad + 1
	 # 		end
	 # 	end
	 # end


	@entriesArray = []
    render template: 'scrape_reddit'
  end
end

