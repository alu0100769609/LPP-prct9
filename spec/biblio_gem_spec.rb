#encodign: utf-8
require 'spec_helper'
require 'biblio_gem'

describe BiblioGem do
    
    it 'has a version number' do
        expect(BiblioGem::VERSION).not_to be nil
    end

   describe "Almacenamiento de datos (1 autor):" do
      before :each do
        @bib1 = BiblioGem::Bibliography.new("Autor1","Titulo1","Fecha1")
      end

      it "El nombre del autor es correcto" do
         @bib1.autor.should eq("Autor1")
      end

      it "El título del libro es correcto" do
         @bib1.titulo.should eq("Titulo1")
      end

      it "La fecha del libro es correcta" do
         @bib1.fecha.should eq("Fecha1")
      end
   end
   
   describe "Almacenamiento de datos (2 autores):" do
      before :each do
         @bib2 = BiblioGem::Bibliography.new(["Autor1","Autor2"],"Titulo2","Fecha2")
      end
      
      it "El nombre de ambos autores son correctos" do
         @bib2.autor.should eq(["Autor1","Autor2"])
      end
      
      it "El título del libro es correcto" do
         @bib2.titulo.should eq("Titulo2")
      end

      it "La fecha del libro es correcta" do
         @bib2.fecha.should eq("Fecha2")
      end
   end
   
   describe "Imprimiendo datos" do
      before :each do
         @bib1 = BiblioGem::Bibliography.new("Autor1","Titulo1","Fecha1")
         @bib2 = BiblioGem::Bibliography.new(["Autor1","Autor2"],"Titulo2","Fecha2")
      end
       
      it "Imprimiendo datos 1" do
         @bib1.to_s.should eq("Autor/es: Autor1\n Titulo: Titulo1\n Fecha: Fecha1\n")
      end
      
      it "Imprimiendo datos 2" do
         @bib2.to_s.should eq("Autor/es: Autor1, Autor2\n Titulo: Titulo2\n Fecha: Fecha2\n")
      end
   end
   
   describe "Comparar 2 referencias bibliográficas" do
      before :each do
            @libro1 = BiblioGem::Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf", "4 edition (July 7, 2013).", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
            @libro2 = BiblioGem::Libro.new(["Dave Thomas", "Andy Hunt"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf", "4 edition (July 7, 2013).", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
            @libro3 = BiblioGem::Libro.new("Scott Chacon"," Pro Git 2009th Edition. (Pro)","Apress; 2009 edition (August 27, 2009)",["ISBN-13: 978-1430218333","ISBN-10: 1430218339"])
            @libro4 = BiblioGem::Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby) Pragmatic Bookshelf", "4 edition (July 7, 2013).", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
            @lista1 = BiblioGem::List.new(@libro1,@libro2,@libro3,@libro4)
      end
      
      it "Libro1 y libro2 tienen distintos autores, libro1 tiene más" do
         expect(@libro1 <=> @libro2).to eq(1)
      end
      
      it "Libro1 y libro3 tienen distinto título, y por tanto no son iguales" do
         expect(@libro1 > @libro3).to eq(true)
      end
      
      it "Libro1 y libro4 son iguales" do
         expect(@libro1 == @libro4).to eq(true)
      end
   end
end
