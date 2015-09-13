require_relative 'RealConExponente'
require_relative 'Automata'
puts "Escribe un real con numero (ej: 13.2E13)"
@estado = 1
automata = Automata.new(@estado)
real = Real.new(automata.get_estado)

cadena = gets.chomp
cadena.each_char do|simbolo|
  @estado = real.trasicion(simbolo)
  break  if @estado < 0
  real.set_estado(@estado)
end

if (@estado == 4 or @estado == 7 or @estado == 2)
  puts "Termino en el estado: #{@estado}"
  codigo_error = 0
else
  codigo_error = @estado
end
ManejoDeErrores.new(codigo_error).get_mesage
