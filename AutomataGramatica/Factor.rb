load 'Automata.rb'
load 'C:\Users\Hertz\RubymineProjects\AutomatasDos\AutomataGramatica\ManejoAutomata.rb'
load 'ManejoCadena.rb'
class Factor < Automata
  def initialize(estado)
    super @estado = estado
  end
  def transicion(cadena)
    obj_manejoAutomata = ManejoAutomata.new
    obj_cadena = ManejoCadena.new
    r = case @estado
          when 1
            if obj_cadena.isParentesisDerecho(cadena)
              @estado = 2
            elsif cadena.match(/^[!]/)
              puts "entro !"
              @estado = 5
            elsif obj_manejoAutomata.isNumero(cadena)
              @estado = 4
            elsif obj_manejoAutomata.isIdentificador(cadena)
              @estado = 4
            else
              @estado = -1
            end
          when 2
            if obj_manejoAutomata.isExpresion(cadena)
              @estado = 3
            else
              @estado = -1
            end
          when 3
            if obj_cadena.isParentesisIzquierdo(cadena)
              @estado = 4
            else
              @estado = -1#error
            end
          when 4
            @estado = 4
          when 5
            if obj_manejoAutomata.isFactor(cadena)
              @estado = 4
            else
              @estado = -1 #error
            end
        end
    return r
  end
end