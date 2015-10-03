load 'Automata.rb'
load 'C:\Users\Hertz\RubymineProjects\AutomatasDos\AutomataGramatica\ManejoAutomata.rb'
load 'ManejoCadena.rb'
class Termino < Automata
  def initialize(estado)
    super @estado = estado
  end
  def transicion(cadena)
    obj_manejoAutomata = ManejoAutomata.new
    obj_cadena = ManejoCadena.new
    r = case @estado
      when 1
        if obj_manejoAutomata.isFactor(cadena)
          @estado = 2
        else
          @estado = -2
        end
      when 2
        #separar
        if obj_cadena.isOperador(cadena)
          puts "entro #{cadena}"
          @estado = 1
        else
          @estado = -1
        end
        end
    puts "estado de termino: #{r}"
    return r
    #verificar el valor del estado, si es estado final retornar true en caso contrario false

  end
end