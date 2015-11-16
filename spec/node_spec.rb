#encodign: utf-8

require 'spec_helper'
require 'biblio_gem'

describe BiblioGem::Node do
    describe "Existen nodos" do
       before :each do
           @nodo1 = BiblioGem::Node.new(:value => "1")
       end
       
       it "El nodo es correcto" do
           expect(@nodo1.to_s).to eq("1")
       end
   end
   
   describe "Existe nodo siguiente" do
       before :each do
           @nodo1 = BiblioGem::Node.new(:value => "1")
           @nodo2 = BiblioGem::Node.new(:value => "2")
           @nodo1.next = @nodo2
       end
       
       it "El nodo 1 apunta al nodo 2" do
           expect(@nodo1.next.to_s).to eq("2")
       end
   end
   
   describe "Adición de un puntero hacia el anterior" do
       before :each do
           @nodo1 = BiblioGem::Node.new(:value => "1")
           @nodo2 = BiblioGem::Node.new(:value => "2")
           @nodo1.next = @nodo2
           @nodo2.prev = @nodo1
       end
       
       it "El nodo 2 apunta al anterior que es el nodo 1" do
           expect(@nodo2.prev.to_s).to eq("1")
       end
   end
   
end