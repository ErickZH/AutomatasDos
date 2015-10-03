load 'ManejoCadena.rb'
load 'ManejoAutomata.rb'
require 'fox16'
include Fox
class VentanaDos < FXMainWindow
  def initialize(app,title,ancho,alto)
    super(app, title, :width => ancho, :height => alto)
    run_icon =FXPNGIcon.new(app, File.open("run.png", "rb").read)

    menu_bar = FXMenuBar.new(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)
    file_menu_pane = FXMenuPane.new(self)
    file_open = FXMenuCommand.new(file_menu_pane, "Open..." )
    file_exit = FXMenuCommand.new(file_menu_pane, "Exit...")
    file_menu_title = FXMenuTitle.new(menu_bar, "File" , :popupMenu => file_menu_pane)
    run_menu_title = FXMenuTitle.new(menu_bar, "Run",:icon => run_icon)

    @text = FXText.new(self, :opts => LAYOUT_EXPLICIT, :x => 60, :y => 40, :width =>480, :height => 250)
    @text.font = FXFont.new(app, "Consolas" , 12, :slant => FXFont::Italic)

    @text_resultado = FXText.new(self,:opts => LAYOUT_EXPLICIT|TEXT_READONLY, :x => 60, :y => 350, :width =>480, :height => 100)
    @text_resultado.font = FXFont.new(app, "Consolas" , 12, :slant => FXFont::Italic)


    file_open.connect(SEL_COMMAND) do

      dialog = FXFileDialog.new(self, "Open File" )
      dialog.patternList = ["Archivo de Texto (*.txt)"]
      dialog.selectMode = SELECTFILE_MULTIPLE
      if dialog.execute != 0
        puts dialog.filename
        linea = File.open(dialog.filename , "r").read
        puts linea
        @text.text = linea
      end
    end

    file_exit.connect(SEL_COMMAND)do
      exit 0
    end


    run_menu_title.connect(SEL_LEFTBUTTONPRESS) do
      t = @text.getText
      @text_resultado.text = ""
      if t == ""
        FXMessageBox.warning(
            self,
            MBOX_OK,
            "Message",
            "NOT RUN!"
        )
      else
       puts "Debe anilzar codigo"
        analizar_sintaxis(t)
      end

    end


    fondo = FXJPGIcon.new(app,File.open("img1.jpg","rb").read)
    lblFondo = FXLabel.new(self,"",:icon=>fondo,:opts=>LAYOUT_EXPLICIT,:x=>0,:y=>0,:width=>500,:height=>300)
    lblFondo.iconPosition=ICON_BEFORE_TEXT
    lblFondo.layoutHints = LAYOUT_CENTER_X|LAYOUT_CENTER_Y
  end
  def analizar_sintaxis(cadena)
    mCadena = ManejoCadena.new()
    array = mCadena.separarCodigo(cadena)
    puts array.to_s
    linea = 1
    msj_consola = ""
    if cadena == ""
      @text_resultado.text = "CADENA ACEPTADA"
    else
      if array.empty?
        # hubo error
        @text_resultado.text = "FALTA CERRAR UN BLOQUE"
      else
       array.each do|elemento|
          if elemento.match(/^const|^var|^procedure/)
            if (ManejoAutomata.new.isBloque(elemento))
              msj_consola += "linea: #{linea}" + " CADENA ACEPTADA\n"
            else
              msj_consola += "linea: #{linea}" + " CADENA NO ACEPTADA\n"
            end
          end
         if elemento.match(/^call|^begin|^if|^while/)
            if (ManejoAutomata.new.isInstruccion(elemento))
              msj_consola += "linea: #{linea}" + " CADENA ACEPTADA\n"
            else
              msj_consola += "linea: #{linea}" + " CADENA NO ACEPTADA\n"
            end
         end
          linea += 1
        end
       @text_resultado.text = msj_consola
      end
    end
  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

app = FXApp.new
VentanaDos.new(app,"Automata",590,530)
app.create
app.run