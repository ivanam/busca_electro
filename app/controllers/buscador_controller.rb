class BuscadorController < ApplicationController


 def buscar
    require 'open-uri'
    require 'mechanize'
    require 'ostruct'
    #recibo por paramtero la cantidad y el nombre del producto
    cantidad_maxima = params["cantidad"]
    cantidad_maxima = cantidad_maxima.to_i
    electro = params["producto"]



    
#HABRIA Q PONER UNA IMAGEN DE DEFECTO SI NO LA ENCUENTRA!!!
#la cantidad max de busqueda la podemos poner desde la vista
#obtener nombre del producto desde la vista
#ESTO ES PARA MANDAR AL INCLUDE DE ABAJO
#name.upcase
#name.downcase
#name.capitalize
#name.titleize



#.............................................................
 ## MUSIMUNDO
 	 mechanizeMusimundo = Mechanize.new
 	 url = 'https://www.musimundo.com/'
 	 #obtengo la pagina
	 pageMusimundo = mechanizeMusimundo.get(url)
	 #busco el formualri opara ingresar una bùqueda
	 form = pageMusimundo.forms.first
	 form['text'] = electro
	 #hago un submit dle form de la pàgina con el nombre del producto
	 pageMusimundo = form.submit
	 #inicializo la variable
     cantidad = 0
     @arrayMusimundo = []
     pageMusimundo.css('a').each do |a|
     	if a.attr('title')  != nil and (a.attr('title').include? electro or a.attr('title').include? electro.upcase or a.attr('title').include? electro.downcase or a.attr('title').include? electro.titleize) and cantidad < cantidad_maxima
     	  
     	   producto = OpenStruct.new
     	   url_base = a.attr('href')
     	   producto.link = url + url_base
     	   a.css('img').each do |h3|
	           	if h3.attr('title') != nil  and (h3.attr('title').include? electro or h3.attr('title').include? electro.upcase or h3.attr('title').include? electro.downcase or h3.attr('title').include? electro.titleize)
	          	 	producto.url = h3.attr('src')
	       	  	end
       	   end
       	   a.css('.mus-pro-price-number span').each do |h|
          	  producto.precio = h.text.strip
           end
           producto.nombre = a.css('.mus-pro-name').text.strip
           producto.cuotas = a.css('.mus-pro-quotes').text.strip
           mechanize2 = Mechanize.new
		   url2 = producto.link
		   page2 = mechanize2.get(url2)
		   producto.info =page2.css('#general').text.strip
		   cantidad = cantidad + 1
           @arrayMusimundo << producto

       end
    end




      
#..................MERCADO LIBRE...........................................
 	 mechanize3 = Mechanize.new
	 page2 = mechanize3.get('https://www.mercadolibre.com.ar/')
	 form = page2.forms.first
	 form['as_word'] = electro
	 page2 = form.submit
	 @entriesArray2 = []
	 cantidad = 0
	 listado = page2.css('section li.results-item')
	 listado.each do |l|
	 	if cantidad < cantidad_maxima and l.css('span.item-installments-text').text.include? ''
	 		 producto = OpenStruct.new
			 if l.css('a').attr('href')!= nil
			 	 	producto.link = l.css('a').attr('href')
			 	 	producto.nombre = l.css('a').css('span.main-title').text
			 else
			 	next
			 end
		     producto.precio = l.css('.price__fraction').text.strip
		     if l.css('img').attr('data-src') != nil
	      	 	producto.url = l.css('img').attr('data-src').text
	      	 else
	      	 	producto.url = l.css('img').attr('src').text
	      	 end 
	      	 mechanize2 = Mechanize.new
		     url2 = producto.link
		     page2 = mechanize2.get(url2)
		     producto.info =page2.css('#description-includes').text.split(" ").first(500).join(" ")
             @entriesArray2 << producto
	  	 	 cantidad = cantidad + 1
	  	else
	  		next
	  	end

	 end

	
     #####FRAVEGA
     mechanize = Mechanize.new
     url = "https://www.fravega.com/"
	 page = mechanize.get(url +'l/'+ electro)
	
	 @entriesArray = []
	 cantidad = 0
	 titulo = ""
	 listado = page.css('ul li a')

	 #listado =page.css('ul li').select{|a| a[:title] if a[:title] != nil}
	 listado.each do |l|
	 	
	 	if cantidad < cantidad_maxima
	 		
	 		if l.attr('title') != nil and (l.attr('title').include? electro or l.attr('title').include? electro.upcase or l.attr('title').include? electro.downcase or l.attr('title').include? electro.titleize) and l.css('img').any? and l.css('span').any? and l.attr('href') != "" and titulo != l.attr('title')
	 			
	 			producto = OpenStruct.new
	 			titulo = l.attr('title')
	 			producto.nombre = l.attr('title')
	 			url_base = l.attr('href')
     	   		producto.link = url + 'p'+url_base
     	   		if l.css('figure span img').any?
     	   			cuotas = l.css('figure span img').attr('src').text
     	   			if cuotas == "https://images.fravega.com/f64/1576b947612d37952fe5de08dc6de08d.png"
     	   				producto.cuotas = "12 cuotas sin interés!!"
     	   			elsif cuotas == "https://images.fravega.com/f64/409098fcbfdb0a0e8b39cc3a7bda5b5c.png"
     	   				producto.cuotas = "18 cuotas sin interés!!"
     	   			end
     	   				
     	   		end
     	   		producto.url = l.css('figure img.productImage').attr("src").text
	 			producto.precio_ant = l.css('p span.pricestyled__ListPrice-sc-1cju1pf-0').text
	 			producto.precio =l.css('p > text()')[0].text
	 			mechanize_frav_2 = Mechanize.new
			    url2 = producto.link
			    page2 = mechanize_frav_2.get(url2)
			    	
			    producto.info = page2.css('div.DescriptionText__Bajada-sc-14hdqca-2').text.strip	 			
			    if producto.info == ""
			    	producto.info = page2.css('.description').text
			    end
			    @entriesArray << producto
	 			cantidad = cantidad + 1

	 		end

	 	end
	 end

	 
    render template: 'scrape_reddit'
  end
 end