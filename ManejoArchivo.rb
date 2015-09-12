class ManejoArchivo
  def initialize(file_name,codigo_error)
    @name_file = file_name
    @error = codigo_error
  end
  def get_description
    if File.exist?(@name_file)
        f = File.open(@name_file)
        f.each do|linea|
          if m = linea.match(/(^#{@error})(\s)(.*)/)
            uno, dos, tres = m.captures
            return tres
          end
        end
      f.close
    end
  end
end
