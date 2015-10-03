load 'Automata.rb'
load 'ManejoAutomata.rb'

class Programa < Automata
  def initialize(estado)
    @estado = estado
  end
  def transicion(cadena)
    obj_manejoAutomata = ManejoAutomata.new
    r = case
          when 1
            if obj_manejoAutomata.isBloque(cadena)
              @estado = 2
            else
              @estado = -1
            end
          when 2
            if obj_manejoAutomata.isInstruccion(cadena)
              @estado = 3
            end

        end
    return estado_tran
  end
end