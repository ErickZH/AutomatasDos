load 'Automata.rb'
load 'C:\Users\Hertz\RubymineProjects\AutomatasDos\AutomataGramatica\ManejoAutomata.rb'
load 'ManejoCadena.rb'

class Instruccion < Automata
  def initialize(estado)
    super @estado = estado
  end
  def transicion(cadena)
    obj_manejoAutomata = ManejoAutomata.new
    obj_cadena = ManejoCadena.new
    r = case @estado
          when 1
            if obj_cadena.isCall(cadena)
              @estado = 5
            elsif obj_cadena.isBegin(cadena)
              @estado = 6
            elsif obj_cadena.is_if(cadena)
              @estado = 8
            elsif obj_cadena.is_while(cadena)
              @estado = 11
            elsif obj_cadena.isNada(cadena)
              @estado = 4
            elsif obj_manejoAutomata.isIdentificador(cadena)
              @estado = 2
            else
              @estado= -2
            end

          when 2
            if obj_cadena.isOperadorAsignacion(cadena)
              @estado = 3
            else
              @estado = -3
            end

          when 3
            if obj_manejoAutomata.isExpresion(cadena)
              @estado = 4
            else
              @estado = -4
            end
          when 4
            @estado = 4
          when 5
            if obj_manejoAutomata.isIdentificador(cadena)
              @estado = 4
            else
              @estado = -4
            end
          when 6
            if obj_manejoAutomata.isInstruccion(cadena)
              @estado = 7
            else
              @estado = -4
            end
          when 7
            if obj_cadena.isPuntoYComa(cadena)
              @estado = 6
            elsif obj_cadena.is_end(cadena)
              @estado = 4
            else
              @estado = -8
            end
          when 8
            if obj_manejoAutomata.isCondicion(cadena)
              @estado = 9
            else
              @estado = -4
            end
          when 9
            if obj_cadena.is_then(cadena)
              @estado = 10
            else
              @estado = -10
            end
          when 10
            if obj_manejoAutomata.isInstruccion(cadena)
              @estado = 4
            else
              @estado = -10
            end
          when 11
            if obj_manejoAutomata.isCondicion(cadena)
              @estado = 12
            else
              @estado = -5
            end
          when 12
            if obj_cadena.is_do(cadena)
              @estado = 10
            else
              @estado = -12
            end
        end
    puts "estado de instruccion: #{r}"
    return r
    #verificar el valor del estado, si es estado final retornar true en caso contrario false

  end
end

