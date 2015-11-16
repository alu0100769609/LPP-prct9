#Modificación prct8: Que se pueda recorrer en ambos sentidos no quiere decir que se puedan insertar por el otro lado..
module BiblioGem
    Node = Struct.new(:value, :next, :prev) do
        attr_accessor :value, :next, :prev
        def initialize(dato)
            @value = dato[:value]
            @next = dato[:next]
            @prev = dato[:prev]
        end
        
        def to_s
            @value.to_s
        end
    end
end