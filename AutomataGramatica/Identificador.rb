load 'Automata.rb'

class Identificador < Automata
  def initialize(estado)
    super @estado = estado
  end
  def transicion(cadena)
    r = case @estado
      when 1
        if cadena.match(/^[a-zA-Z]/)
          @estado = 2
        else
          @estado = -3#estado de error, Un identificador debe iniciar con una letra
        end
      when 2
        if cadena.match(/^[0-9]/)
          @bandera = "digito"
          @estado = 2
        elsif cadena.match(/^[a-zA-Z]/)
          @bandera = "letra"
          @estado = 2
        else
          @estado = -3#error
        end
        end
    puts "Valor del estado de identificador #{r}"
    return r
  end
end
