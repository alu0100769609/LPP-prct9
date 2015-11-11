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
            @libro1 = BiblioGem::Bibliography.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf", "4 edition (July 7, 2013).", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
            @libro2 = BiblioGem::Bibliography.new("Scott Chacon"," Pro Git 2009th Edition. (Pro)","Apress; 2009 edition (August 27, 2009)",["ISBN-13: 978-1430218333","ISBN-10: 1430218339"])
            @libro3 = BiblioGem::Bibliography.new(["David Flanagan","Yukihiro Matsumoto"],"The Ruby Programming Language. O’Reilly Media","1 Edition (February 4, 2008)",["ISBN-10: 0596516177","ISBN-13: 978-0596516178"])
            @libro4 = BiblioGem::Bibliography.new(["David Chelimsky","Dave Astels","Bryan Helmkamp","Dan North","Zach Dennis","Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). PragmaticBookshelf","1 edition (December 25, 2010)",["ISBN-10: 1934356379","ISBN-13: 978-1934356371"])
            @libro5 = BiblioGem::Bibliography.new("Richard E"," . Silverman Git Pocket Guide O’Reilly Media","1 edition (August 2, 2013)",["ISBN-10: 1449325866","ISBN-13: 978-1449325862"])
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
        it "Los libros son mostrados correctamente" do
            @libro1.to_s.should eq("Autor/es: Dave Thomas, Andy Hunt, Chad Fowler\n Titulo: Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf\n Fecha: 4 edition (July 7, 2013).\n ISBN: [\"ISBN-13: 978-1937785499\", \"ISBN-10: 1937785491\"]\n")
            @libro2.to_s.should eq("Autor/es: Scott Chacon\n Titulo:  Pro Git 2009th Edition. (Pro)\n Fecha: Apress; 2009 edition (August 27, 2009)\n ISBN: [\"ISBN-13: 978-1430218333\", \"ISBN-10: 1430218339\"]\n")
            @libro3.to_s.should eq("Autor/es: David Flanagan, Yukihiro Matsumoto\n Titulo: The Ruby Programming Language. O’Reilly Media\n Fecha: 1 Edition (February 4, 2008)\n ISBN: [\"ISBN-10: 0596516177\", \"ISBN-13: 978-0596516178\"]\n")
            @libro4.to_s.should eq("Autor/es: David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy\n Titulo: The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). PragmaticBookshelf\n Fecha: 1 edition (December 25, 2010)\n ISBN: [\"ISBN-10: 1934356379\", \"ISBN-13: 978-1934356371\"]\n")
            @libro5.to_s.should eq("Autor/es: Richard E\n Titulo:  . Silverman Git Pocket Guide O’Reilly Media\n Fecha: 1 edition (August 2, 2013)\n ISBN: [\"ISBN-10: 1449325866\", \"ISBN-13: 978-1449325862\"]\n")
        end
        
        it "To_s" do
            @lista1.to_s.should eq("#{@libro1.to_s}\n\n#{@libro2.to_s}\n\n#{@libro3.to_s}\n\n#{@libro4.to_s}\n\n#{@libro5.to_s}")
        end
    end
end