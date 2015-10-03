load 'ManejoCadena.rb'
load 'Expresion.rb'
require 'fox16'
include Fox
class VentanaDos < FXMainWindow
def initialize(app,title,ancho,alto)
  super(app, title, :width => ancho, :height => alto)
  FXToolTip.new(app)#creamos un ToolTip
  #declaramos el frame horizontal
  #frame = FXHorizontalFrame.new(self)
  label = FXLabel.new(self,"Cadena: ",:opts=>FRAME_LINE|LAYOUT_EXPLICIT,:x=>10,:y=>10,:width=>50,:height=>30)

  name_target = FXDataTarget.new("")

  textfield = FXTextField.new(self,20,:target=>name_target,:selector=>FXDataTarget::ID_VALUE,:opts=>LAYOUT_EXPLICIT,:x=>80,:y=>10,:width=>300,:height=>30)
  textfield.tipText = "Introduce tu cadena"

  boton = FXButton.new(self,"Aceptar\tAceptar",:opts=>LAYOUT_NORMAL|LAYOUT_EXPLICIT,:x=>420,:y=>10,:width=>100,:height=>30)

  label_msj = FXLabel.new(self,"",:opts=>FRAME_LINE|LAYOUT_EXPLICIT,:x=>5,:y=>230,:width=>590,:height=>40)


  fondo = FXJPGIcon.new(app,File.open("img.jpg","rb").read)
  lblFondo = FXLabel.new(self,"",:icon=>fondo,:opts=>LAYOUT_EXPLICIT,:x=>0,:y=>0,:width=>500,:height=>300)
  lblFondo.iconPosition=ICON_BEFORE_TEXT
  lblFondo.layoutHints = LAYOUT_CENTER_X|LAYOUT_CENTER_Y
  boton.connect(SEL_COMMAND)do
    puts "La cadena(botom) es #{name_target.value}"
  end

  name_target.connect(SEL_COMMAND)do

    label_msj.setText("")
    cadena = (name_target.value).to_s
    array = ManejoCadena.new.separarExpresion(cadena)
    puts "Array"+ array.to_s
    @estado = 1
    expresion = Expresion.new(@estado)

    array.each do|token|
      @estado = expresion.transicion(token)
      break if @estado < 0
      expresion.set_estado(@estado)
    end
    if @estado == 3
      puts "Aceptada"
      label_msj.setText("CADENA ACEPTADA")
    else
      puts "No aceptada"
      label_msj.setText("CADENA NO ACEPTADA")
    end
    #t = Expresion.new(1).transicion(cadena)
    #if t == 3
    # puts "Aceptado"
    # label_msj.setText("CADENA ACEPTADA")
    #else
     # label_msj.setText("CADENA NO ACEPTADA")
    #end
  end

  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end
app = FXApp.new
VentanaDos.new(app,"Automata",600,400)
app.create
app.run
