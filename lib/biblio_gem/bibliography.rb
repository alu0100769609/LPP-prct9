module BiblioGem
	class Bibliography
		attr_accessor :autor, :titulo, :fecha

		def initialize (autor, titulo, fecha)
			@autor, @titulo, @fecha = autor, titulo, fecha
		end

		def to_s
			if @autor.is_a? Array
				"Autor/es: #{@autor.join(", ")}\n Titulo: #{@titulo}\n Fecha: #{@fecha}\n"
			else
				"Autor/es: #{@autor}\n Titulo: #{@titulo}\n Fecha: #{@fecha}\n"
			end
		end
	end
	
	class Libro < Bibliography
		def initialize (autor, titulo, fecha, isbn)
			super(autor, titulo, fecha)
			@isbn = isbn
		end
		
		def to_s
			dato = super
			if @isbn.is_a? Array
				dato << " ISBN: [\"#{@isbn.join("\", \"")}\"]\n"
			else
				dato << " ISBN: #{@isbn}\n"
			end
			dato 					#Devolvemos la cadena dato
		end
	end

	class Revista < Bibliography
		def initialize (autor, titulo, fecha, issn)
			super(autor, titulo, fecha)
			@issn = issn
		end
		
		def to_s
			dato = super
			if @issn.is_a? Array
				dato << " ISBN: [\"#{@issn.join("\", \"")}\"]\n"
			else
				dato << " ISBN: #{@issn}\n"
			end
			dato 					#Devolvemos la cadena dato
		end
	end

end
=begin
        def to_s
        	dato = ""
   			if (@head != nil)
				aux = @head
				while (aux.next != nil) do
					dato << aux.to_s
					dato << "\n\n"
					aux = aux.next
				end 
				dato << aux.to_s	#Cogemos el último elemento que se omite en el bucle
				dato				#Devolvemos la cadena con la lista de bibliografías
			end
        end
=end