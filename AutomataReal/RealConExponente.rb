require_relative 'Automata'
class Real < Automata
  def initialize(estado)
    super @estado = estado
  end
 def trasicion(simbolo)

   case @estado
     when 1
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 2
       elsif ManejoCadena.new.isSigno(simbolo)
         @estado = 9
       else
         @estado = -8
       end
     when 2
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 2
       elsif ManejoCadena.new.isPunto(simbolo)
         @estado = 3
       else
         if ManejoCadena.new.isNumeroE(simbolo)
           @estado = 5
         else
           @estado = -2
         end
       end
     when 3
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 4
       else
         @estado = -3
       end
     when 4
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 4
       elsif ManejoCadena.new.isNumeroE(simbolo)
         @estado = 5
       else
         @estado = -4
       end
     when 5
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 7
       elsif ManejoCadena.new.isSigno(simbolo)
         @estado = 6
       else
         @estado = -5
       end
     when 6
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 7
       else
          @estado = -6
       end
     when 7
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 7
       else
         @estado = -7
       end
     when 9
       if ManejoCadena.new.isDigito(simbolo)
         @estado = 2
       else
         @estado = -6
       end
    end
   end
 end