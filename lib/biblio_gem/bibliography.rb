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

		def <=>(anOther)
			if ((titulo.size <=> anOther.titulo.size) == 0)
    			autor.size <=> anOther.autor.size
    		else
    			titulo.size <=> anOther.titulo.size
    		end
		end

		def >(anOther)
			if ((titulo.size > anOther.titulo.size) == 0)
    			autor.size > anOther.autor.size
    		else
    			titulo.size > anOther.titulo.size
    		end
		end

		def <(anOther)
			if ((titulo.size < anOther.titulo.size) == 0)
    			autor.size < anOther.autor.size
    		else
    			titulo.size < anOther.titulo.size
    		end
		end

		def ==(anOther)
			if ((titulo.size == anOther.titulo.size) == 0)
    			autor.size == anOther.autor.size
    		else
    			titulo.size == anOther.titulo.size
    		end
		end

	end
	
	class Libro < Bibliography
		attr_accessor :isbn
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
		attr_accessor :issn
		def initialize (autor, titulo, fecha, issn)
			super(autor, titulo, fecha)
			@issn = issn
		end
		
		def to_s
			dato = super
			if @issn.is_a? Array
				dato << " ISSN [\"#{@issn.join("\", \"")}\"]\n"
			else
				dato << " ISSN #{@issn}\n"
			end
			dato 					#Devolvemos la cadena dato
		end
	end
end
