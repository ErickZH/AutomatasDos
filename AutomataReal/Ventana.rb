require 'fox16'
require_relative 'RealConExponente'
require_relative 'Automata'

include Fox

class HelloWindow < FXMainWindow
  def initialize(app,title,ancho,alto)
    super(app, title, :width => ancho, :height => alto)
    frame1 = FXHorizontalFrame.new(self)
    label = FXLabel.new(frame1,"Cadena: ")
    name_target = FXDataTarget.new("")
    textfield = FXTextField.new(frame1,30,:target=>name_target,:selector=>FXDataTarget::ID_VALUE)
    label_msj = FXLabel.new(self,"",:opts=>FRAME_LINE|LAYOUT_EXPLICIT,:x=>5,:y=>50,:width=>295,:height=>40)

    boton = FXButton.new(self,"Aceptar",:opts=>FRAME_SUNKEN|FRAME_THICK|LAYOUT_EXPLICIT,:x=>60,:y=>130,:width=>80,:height=>40)
    boton_salir = FXButton.new(self,"Salir",:opts=>FRAME_SUNKEN|FRAME_THICK|LAYOUT_EXPLICIT,:x=>180,:y=>130,:width=>80,:height=>40)
    #boton.connect(SEL_COMMAND)do
     # puts "La cadena(boton) es #{name_target.value}"
      #@cadena = name_target.value.to_s
      #puts analizar_cadena(@cadena)
    #end
    name_target.connect(SEL_COMMAND)do
      puts "La cadena(FXTextField) es #{name_target.value}"
      cadena = name_target.value.to_s
      @estado = 1
      automata = Automata.new(@estado)
      real = Real.new(automata.get_estado)
      cadena.each_char do|simbolo|
        puts simbolo
        @estado = real.trasicion(simbolo)
        break if @estado < 0
        puts @estado
        real.set_estado(@estado)
      end
      if (@estado == 4 or @estado == 7 or @estado == 2)
        codigo_error = 0
      elsif @estado > 0
        codigo_error = 1
      else
        codigo_error = @estado
      end
      label_msj.setText(ManejoDeErrores.new(codigo_error).get_mesage)
    end

  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

app = FXApp.new
HelloWindow.new(app,"Automata Real",300,200)
app.create
app.run
