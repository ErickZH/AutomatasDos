require_relative 'ManejoArchivo'
class ManejoDeErrores
  def initialize(codigo_error)
    @error = codigo_error
  end
  def get_mesage
    ManejoArchivo.new("Errores.txt",@error).get_description
  end
end