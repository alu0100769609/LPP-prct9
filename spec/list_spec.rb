#encodign: utf-8

require 'spec_helper'
require 'biblio_gem'

describe BiblioGem::List do
    describe "Manipulación de nodos en la lista" do
        before :each do
            @lista1 = BiblioGem::List.new("1","2","3")
        end
        
        it "La lista no está vacía" do
            expect(@lista1.size).to eq(3)
        end
        
        it "Insertar un elemento" do
            @lista1.push("4")
            expect(@lista1.size).to eq(4)
        end
        
        it "Eliminar un elemento" do
            @lista1.pop()
            expect(@lista1.size).to eq(2)
        end
    end
    
    describe "Referencias bibliográficas" do
        before :each do
            @libro1 = BiblioGem::Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf", "4 edition (July 7, 2013).", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
            @libro2 = BiblioGem::Libro.new("Scott Chacon"," Pro Git 2009th Edition. (Pro)","Apress; 2009 edition (August 27, 2009)",["ISBN-13: 978-1430218333","ISBN-10: 1430218339"])
            @libro3 = BiblioGem::Libro.new(["David Flanagan","Yukihiro Matsumoto"],"The Ruby Programming Language. O’Reilly Media","1 Edition (February 4, 2008)",["ISBN-10: 0596516177","ISBN-13: 978-0596516178"])
            @libro4 = BiblioGem::Libro.new(["David Chelimsky","Dave Astels","Bryan Helmkamp","Dan North","Zach Dennis","Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). PragmaticBookshelf","1 edition (December 25, 2010)",["ISBN-10: 1934356379","ISBN-13: 978-1934356371"])
            @libro5 = BiblioGem::Libro.new("Richard E"," . Silverman Git Pocket Guide O’Reilly Media","1 edition (August 2, 2013)",["ISBN-10: 1449325866","ISBN-13: 978-1449325862"])
            @lista1 = BiblioGem::List.new(@libro1,@libro2,@libro3,@libro4,@libro5)
        end
        
        it "El número de libros es correcto" do
            expect(@lista1.size).to eq(5)
        end
        
        it "Los libros son accedidos correctamente" do
            expect(@lista1.pop).to be(@libro1)
            expect(@lista1.pop).to be(@libro2)
            expect(@lista1.pop).to be(@libro3)
            expect(@lista1.pop).to be(@libro4)
            expect(@lista1.pop).to be(@libro5)
        end
        it "Los libros son mostrados correctamente de forma individual" do
            expect(@libro1.to_s).to eq("Autor/es: Dave Thomas, Andy Hunt, Chad Fowler\n Titulo: Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf\n Fecha: 4 edition (July 7, 2013).\n ISBN: [\"ISBN-13: 978-1937785499\", \"ISBN-10: 1937785491\"]\n")
            expect(@libro2.to_s).to eq("Autor/es: Scott Chacon\n Titulo:  Pro Git 2009th Edition. (Pro)\n Fecha: Apress; 2009 edition (August 27, 2009)\n ISBN: [\"ISBN-13: 978-1430218333\", \"ISBN-10: 1430218339\"]\n")
            expect(@libro3.to_s).to eq("Autor/es: David Flanagan, Yukihiro Matsumoto\n Titulo: The Ruby Programming Language. O’Reilly Media\n Fecha: 1 Edition (February 4, 2008)\n ISBN: [\"ISBN-10: 0596516177\", \"ISBN-13: 978-0596516178\"]\n")
            expect(@libro4.to_s).to eq("Autor/es: David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy\n Titulo: The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). PragmaticBookshelf\n Fecha: 1 edition (December 25, 2010)\n ISBN: [\"ISBN-10: 1934356379\", \"ISBN-13: 978-1934356371\"]\n")
            expect(@libro5.to_s).to eq("Autor/es: Richard E\n Titulo:  . Silverman Git Pocket Guide O’Reilly Media\n Fecha: 1 edition (August 2, 2013)\n ISBN: [\"ISBN-10: 1449325866\", \"ISBN-13: 978-1449325862\"]\n")
        end
        
        it "Los libros son mostrados correctamente de forma colectiva" do
            expect(@lista1.to_s).to eq("#{@libro1.to_s}\n\n#{@libro2.to_s}\n\n#{@libro3.to_s}\n\n#{@libro4.to_s}\n\n#{@libro5.to_s}")
        end
    end
    
    describe "Pruebas de herencia" do
        before :each do
            @libro1 = BiblioGem::Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf", "4 edition (July 7, 2013).", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
            @revista1 = BiblioGem::Revista.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf", "4 edition (July 7, 2013).", "1234-5678")
            @lista1 = BiblioGem::List.new(@libro1,@revista1)
        end
        
        it "El libro1 es de la clase libro" do
            expect(@libro1.is_a? BiblioGem::Libro).to eq(true)
        end
        
        it "El libro1 es de la clase bibliography" do
            expect(@libro1.is_a? BiblioGem::Bibliography).to eq(true)
        end
        
        it "El libro1 es una instancia de la clase libro" do
            expect(@libro1.instance_of? BiblioGem::Libro).to eq(true)
        end
        
        it "El libro1 no es una instancia de la clase bibliography" do
            expect(@libro1.instance_of? BiblioGem::Bibliography).to eq(false)
        end
        
        it "El libro1 no tiene issn" do
            expect(@libro1.respond_to?(:issn)).to eq(false)
        end
        
        it "La revista1 tiene issn" do
            expect(@revista1.respond_to?(:issn)).to eq(true)
        end
        
        it "La revista1 no tiene isbn" do
            expect(@revista1.respond_to?(:isbn)).to eq(false)
        end
        
        it "La lista nueva lista es mostrada correctamente (libro1 + revista1" do
            expect(@lista1.to_s).to eq("#{@libro1.to_s}\n\n#{@revista1.to_s}")
        end
    end

   describe "Referencias bibliográficas, módulo enumerable" do
      before :each do
            @l = BiblioGem::List.new("Dato2","Dato1","Dato3")
      end
        
      it "Comprobando metodo any?" do
         expect(@l.any?{|dato| dato=="Dato2"}).to eq(true)
         expect(@l.any?{|dato| dato=="Dato4"}).to eq(false)
      end
        
      it "comprobrando el metodo count" do
         expect(@l.count).to eq(3)
      end
        
      it "comprobrando max" do
         expect(@l.max).to eq("Dato3")
      end
        
      it "comprobrando min" do
         expect(@l.min).to eq("Dato1")
      end
        
      it "comprobrando sort" do
         expect(@l.sort).to eq(["Dato1","Dato2","Dato3"])
      end
   end

end