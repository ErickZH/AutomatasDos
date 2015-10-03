load 'Automata.rb'
load 'C:\Users\Hertz\RubymineProjects\AutomatasDos\AutomataGramatica\ManejoAutomata.rb'
class Expresion < Automata
  def initialize(estado)
    super @estado = estado
  end
  def transicion(cadena)
    obj_manejoAutomata = ManejoAutomata.new
    r = case @estado
      when 1
        if cadena.match(/^[+|-]/)
          puts "Entro Signo #{cadena}"
          @estado = 2
        elsif (obj_manejoAutomata.isTermino(cadena))
          @estado = 3
        else
          @estado = -2
        end
      when 2
        if (obj_manejoAutomata.isTermino(cadena))
          @estado = 3
        else
          @estado = -3
        end
      when 3
        if cadena.match(/^[+|-]/)
          puts "Entro Signo #{cadena}"
          @estado = 2
        else
          @estado = -2
        end
      else
        puts "Error"
        end
    return r

  end

end