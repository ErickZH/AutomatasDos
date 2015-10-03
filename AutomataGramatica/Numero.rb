require_relative 'Automata'

class Numero < Automata
  def initialize(estado)
    super @estado = estado
  end
  def trasicion(simbolo)

    r = case @estado
      when 1
        if simbolo.match(/[\d]/)
          @estado = 2
        elsif simbolo.match(/^[+|-]/)
          @estado = 9
        else
          @estado = -8
        end
      when 2
        if simbolo.match(/[\d]/)
          @estado = 2
        elsif simbolo.match(/[.]/)
          @estado = 3
        else
          if simbolo.match(/[e|E]/)
            @estado = 5
          else
            @estado = -2
          end
        end
      when 3
        if simbolo.match(/[\d]/)
          @estado = 4
        else
          @estado = -3
        end
      when 4
        if simbolo.match(/[\d]/)
          @estado = 4
        elsif simbolo.match(/[e|E]/)
          @estado = 5
        else
          @estado = -4
        end
      when 5
        if simbolo.match(/[\d]/)
          @estado = 7
        elsif simbolo.match(/[+|-]/)
          @estado = 6
        else
          @estado = -5
        end
      when 6
        if simbolo.match(/[\d]/)
          @estado = 7
        else
          @estado = -6
        end
      when 7
        if simbolo.match(/[\d]/)
          @estado = 7
        else
          @estado = -7
        end
      when 9
        if simbolo.match(/[\d]/)
          @estado = 2
        else
          @estado = -6
        end
        end
    puts "estado para numero: #{r}"
    return r
  end
end