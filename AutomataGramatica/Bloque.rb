load 'Automata.rb'
load 'ManejoAutomata.rb'
load 'ManejoCadena.rb'
class Bloque < Automata
  def initialize(estado)
    super @estado = estado
  end
  def transicion(cadena)
    obj_manejoAutomata = ManejoAutomata.new
    obj_cadena = ManejoCadena.new
    r = case @estado
          when 1
            if obj_cadena.is_const(cadena)
              @estado = 2
            elsif obj_cadena.is_var(cadena)
              @estado = 7
            elsif obj_cadena.isProcedure(cadena)
              @estado = 9
            else
              @estado = -2
            end

          when 2
            if obj_manejoAutomata.isIdentificador(cadena)
              @estado = 3
            else
              @estado = -3
            end

          when 3
            if obj_cadena.isIgual(cadena)
              @estado = 4
            else
              @estado -4
            end

          when 4
            if obj_manejoAutomata.isIdentificador(cadena)
              @estado= 5
            else
              @estado = -5
            end

          when 5
            if obj_cadena.isPuntoYComa(cadena)
              @estado = 6
            elsif obj_cadena.isComa(cadena)
              @estado = 2
            else
              @estado = -6
            end

          when 6
            if obj_cadena.is_const(cadena)
              @estado = 2
            elsif obj_cadena.is_var(cadena)
              @estado = 7
            elsif obj_cadena.isProcedure(cadena)
              @estado = 9
            else
              @estado = -2
            end
          when 7
            if obj_manejoAutomata.isIdentificador(cadena)
              @estado = 8
            else
              @estado = -8
            end

          when 8
            if obj_cadena.isComa(cadena)
              @estado = 7
            elsif obj_cadena.isPuntoYComa(cadena)
              @estado = 6
            else
              @estado = -6
            end

          when 9
            if obj_manejoAutomata.isIdentificador(cadena)
              @estado = 10
            else
              @estado = -10
            end

          when 10
            if obj_cadena.isPuntoYComa(cadena)
              @estado = 6
            else
              @estado = -11
            end
        end
    puts "estado de bloque: #{r}"
    return r
    #verificar el valor del estado, si es estado final retornar true en caso contrario false

  end
end