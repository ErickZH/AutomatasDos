require 'spreadsheet'
class ManejoArchivo
  def initialize(file_name)
    @file = file_name
    @book = Spreadsheet.open(@file)
  end
  def get_palabras_servadas
    a = Array.new
    @sheet1 = @book.worksheet 0
    0.upto(@sheet1.last_row_index) do|i|
      cadena = @sheet1.cell(i,0)
      a << cadena.to_s
    end
    return a
  end
end