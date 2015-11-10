#encodign: utf-8

require 'spec_helper'
require 'biblio_gem'

describe BiblioGem::List do
    describe "Manipulación de nodos en la lista" do
        before :each do
            @lista1 = BiblioGem::List.new("1","2","3")
        end
        
        it "La lista no está vacía" do
            expect(@lista1.size).to eq("3")
        end
        
        it "Insertar un elemento" do
            @lista.push("4")
            expect(@lista1.size).to eq("4")
        end
        
        it "Eliminar un elemento" do
            @lista.pop()
            expect(@lista1.size).to eq("2")
        end
    end
end