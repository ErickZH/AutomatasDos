require 'fox16'
require_relative 'RealConExponente'
#require_relative 'Automata'
include Fox

class VentanaDos < FXMainWindow
  def initialize(app,title,ancho,alto)
    super(app, title, :width => ancho, :height => alto)
    FXToolTip.new(app)#creamos un ToolTip
    #declaramos el frame horizontal
    #frame = FXHorizontalFrame.new(self)
    label = FXLabel.new(self,"Cadena: ",:opts=>FRAME_LINE|LAYOUT_EXPLICIT,:x=>10,:y=>10,:width=>50,:height=>30)

    name_target = FXDataTarget.new("")

    textfield = FXTextField.new(self,20,:target=>name_target,:selector=>FXDataTarget::ID_VALUE,:opts=>LAYOUT_EXPLICIT,:x=>80,:y=>10,:width=>200,:height=>30)
    textfield.tipText = "Introduce tu cadena"

    boton = FXButton.new(self,"Aceptar\tAceptar",:opts=>LAYOUT_NORMAL|LAYOUT_EXPLICIT,:x=>300,:y=>10,:width=>100,:height=>30)

    label_edo_actual = FXLabel.new(self,"Estado Actual: ",:opts=>LAYOUT_EXPLICIT|JUSTIFY_LEFT,:x=>10,:y=>80,:width=>150,:height=>30)
    label_simbolo = FXLabel.new(self,"Simbolo: ",:opts=>LAYOUT_EXPLICIT|JUSTIFY_LEFT,:x=>10,:y=>120,:width=>150,:height=>30)
    label_edo_nuevo = FXLabel.new(self,"Estado Nuevo: ",:opts=>LAYOUT_EXPLICIT|JUSTIFY_LEFT,:x=>10,:y=>170,:width=>150,:height=>30)
    label_msj = FXLabel.new(self,"",:opts=>FRAME_LINE|LAYOUT_EXPLICIT,:x=>5,:y=>230,:width=>590,:height=>40)


    fondo = FXJPGIcon.new(app,File.open("img.jpg","rb").read)
    lblFondo = FXLabel.new(self,"",:icon=>fondo,:opts=>LAYOUT_EXPLICIT,:x=>0,:y=>0,:width=>500,:height=>300)
    lblFondo.iconPosition=ICON_BEFORE_TEXT
    lblFondo.layoutHints = LAYOUT_CENTER_X|LAYOUT_CENTER_Y
    boton.connect(SEL_COMMAND)do
      puts "La cadena(botom) es #{name_target.value}"
    end

    name_target.connect(SEL_COMMAND)do
      puts "La cadena(FXTextField) es #{name_target.value}"
      cadena = name_target.value.to_s
      @estado = 1
      real = Real.new(@estado)
      Thread.new do
        cadena.each_char do|simbolo|
          puts "simbolo: "+ simbolo.to_s
          label_edo_actual.setText("Estado Actual: "+real.get_estado.to_s)
          label_simbolo.setText("Simbolo: "+simbolo.to_s)
          @estado = real.trasicion(simbolo)

          break if @estado < 0
          puts @estado
          real.set_estado(@estado)
          label_edo_nuevo.setText("Estado Nuevo: "+@estado.to_s)
          sleep 2
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

  end
  def create
   super
   show(PLACEMENT_SCREEN)
  end
end
#app = FXApp.new
#HelloWindow.new(app,"Automata",600,400)
#app.create
#app.run
