module BiblioGem
	class List
	    attr_accessor :head, :size
	    def initialize(*dato)
	        @head = nil
	        @size = 0
	        if (dato != nil)
	            self.push(*dato)
	        end
	    end
	   
        def push(*dato)
			if (@head != nil)
				aux = @head
				while (aux.next != nil) do
					aux = aux.next
				end 
			end
			
			dato.each do |value|
				if (@head == nil)
					@head = Node.new(:value => value)
					aux = @head
				else
					aux.next = Node.new(:value => value)
					aux = aux.next
				end
				@size += 1
			end
        end
        
        def pop
            if (@size == 0)
                return false
            end
			aux = @head
			@head = aux.next
			@size -= 1
			aux.value
        end
                
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
	end
end