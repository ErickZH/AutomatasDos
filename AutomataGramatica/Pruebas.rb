require 'fox16'
include Fox
load 'ManejoCadena.rb'


app = FXApp.new
ecr = FXMainWindow.new( app, "fileDialog" )
FXButton.new(ecr,"choix")    do |btn|
  btn.connect(SEL_COMMAND) do
    openDialog = FXFileDialog.new( app, "Open File")
    openDialog.patternList = ["Archivo de Texto (*.txt)"]
    if openDialog.execute != 0
      ruta = openDialog.filename
      archivo = ruta.to_s
      if File.exist?(archivo)
        @array = Array.new
        f = File.open(archivo)
        f.each do|linea|
          array_aux = ManejoCadena.new.separarBloque(linea)
          puts array_aux.to_s
          @array = @array + array_aux
        end
        f.close
        puts @array.join(" ")
      else
        puts "#{archivo} no exites"
      end
    end
    #reccorremos el array para encontar las palabras reservadas

  end
end
app.create()
ecr.show(PLACEMENT_SCREEN)
app.run()