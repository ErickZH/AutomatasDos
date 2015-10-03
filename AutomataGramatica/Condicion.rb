load 'Automata.rb'
load 'C:\Users\Hertz\RubymineProjects\AutomatasDos\AutomataGramatica\ManejoAutomata.rb'
load 'ManejoCadena.rb'
class Condicion < Automata
  def initialize(estado)
    super @estado = estado
  end
  def transicion(cadena)
    obj_manejoAutomata = ManejoAutomata.new
    obj_cadena = ManejoCadena.new
    r = case @estado
          when 1
            if obj_cadena.isOdd(cadena)
              @estado = 2
            elsif obj_manejoAutomata.isExpresion(cadena)
              @estado = 4
            else
              @estado = -1#
            end
          when 2
            if obj_manejoAutomata.isExpresion(cadena)
              @estado = 3
            else
              @estado = -1
            end
          when 3
            @estado = 3
          when 4
            if obj_cadena.isOperadorLogico(cadena)
              puts "entro operador logico: #{cadena}"
              @estado = 2
            else
              @estado = -1
            end
        end
    return r
  end
end
