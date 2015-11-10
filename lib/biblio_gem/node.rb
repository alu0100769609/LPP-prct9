module BiblioGem
    Node = Struct.new(:value, :next) do
        attr_accessor :value, :next
        def initialize(dato)
            @value = dato[:value]
            @next = dato[:next]
        end
        
        def to_s
            @value.to_s
        end
    end
end