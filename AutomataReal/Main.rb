require 'fox16'
include Fox
require_relative 'Ventana2'
class Presentacion < FXMainWindow
  def initialize(app,title,ancho,alto)
    super(app, title, :width => ancho, :height => alto)

    boton = FXButton.new(self,"Continuar\tContinuar",:opts=>LAYOUT_NORMAL|LAYOUT_EXPLICIT,:x=>500,:y=>400,:width=>100,:height=>30)
    boton.connect(SEL_COMMAND)do
      puts "Presionaste continuaar"
     # mainWindow2 = FXMainWindow.new(app,"Ventana 2",icon=nil,miniIcon=nil,opts=DECOR_ALL,x=0,y=0,width=500,height=500,padLeft=0,padRight=0,padTop=0,padBottom=0,hSpacing=4,vSpacing=4)
      #mainWindow2.create
      #mainWindow2.show(PLACEMENT_SCREEN)
      ventana2 = VentanaDos.new(app,"Ventana2",600,400)
      ventana2.create
      self.close
    end

    fondo = FXJPGIcon.new(app,File.open("ruby.jpg","rb").read)
    lblFondo = FXLabel.new(self,"",:icon=>fondo,:opts=>LAYOUT_EXPLICIT,:x=>0,:y=>0,:width=>700,:height=>400)
    lblFondo.iconPosition=ICON_BEFORE_TEXT
    lblFondo.layoutHints = LAYOUT_CENTER_X|LAYOUT_CENTER_Y
  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

app = FXApp.new
Presentacion.new(app,"Principal",700,500)
app.create
app.run