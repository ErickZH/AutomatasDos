require 'spreadsheet'
class ManejoArchivo
  def initialize(file_name,codigo_error)
    @name_file = file_name
    @error = codigo_error
    @book = Spreadsheet.open(@name_file)

  end
  def get_description
    @sheet1 = @book.worksheet 0
    0.upto(@sheet1.last_row_index) do|i|#ciclo que itera las filas
      if @sheet1.cell(i,0) == @error# si el codigo de error es igual al error pasado como argumento
          puts @sheet1.cell(i,1)#se imprime la descripcion del error
      end
    end
  end
end
