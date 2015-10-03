class ManejoAutomata

  def isIdentificador(cadena)
    load 'Identificador.rb'
    #creamos un objeto de la clase identificador
    obj_identificador = Identificador.new(1)
    cadena.each_char do|simbolo|
      @estado = obj_identificador.transicion(simbolo)
      break if @estado < 0
      obj_identificador.set_estado(@estado)
    end

    if @estado == 2
      return true
      else return false
    end

  end
  def isCondicion(cadena)
    load 'Condicion.rb'
    load 'ManejoCadena.rb'
    @estado = 1
    condicion = Condicion.new(@estado)
    array = ManejoCadena.new.separarCondicion(cadena)
    puts "Entro condicion: "+array.to_s
    array.each do|token|
      @estado = condicion.transicion(token)
      break if @estado < 0
      condicion.set_estado(@estado)
    end
    if (@estado == 3)
      return true
    else
      return false
    end
  end

  def isInstruccion(cadena)
    load 'Instruccion.rb'
    load 'ManejoCadena.rb'
    @estado = 1
    instruccion = Instruccion.new(@estado)
    array = ManejoCadena.new.separarInstruccion(cadena)
    puts "Entro Instruccion: "+array.to_s
    array.each do|token|
      puts "token :" + token
      @estado = instruccion.transicion(token)
      break if @estado < 0
      instruccion.set_estado(@estado)
    end
    if (@estado == 4)
      return true
    else
      return false
    end
  end



  def isNumero(cadena)
    load 'Numero.rb'
    obj_numero = Numero.new(1)
    cadena.each_char do|simbolo|
      @estado = obj_numero.trasicion(simbolo)
      break if @estado < 0
      obj_numero.set_estado(@estado)
    end
    if @estado == 4
      return @estado = 0
    elsif @estado == 7
      return @estado = 0
    elsif @estado == 2
      return true
    else
      return false
    end
  end

  def isExpresion(cadena)
    load 'Expresion.rb'
    load 'ManejoCadena.rb'
    @estado = 1
    expresion = Expresion.new(@estado)
    array = ManejoCadena.new.separarExpresion(cadena)
    puts "Entro expresion: "+array.to_s
    array.each do|token|
      @estado = expresion.transicion(token)
      break if @estado < 0
      expresion.set_estado(@estado)
    end
    if @estado == 3
    return true
    else
      return false
      end
  end

  def isFactor(cadena)
    load 'Factor.rb'
    load 'ManejoCadena.rb'
    @estado = 1
    factor = Factor.new(@estado)
    array = ManejoCadena.new.separarFactor(cadena)
    puts "Factor: "+ array.to_s
    array.each do|token|
      puts "entro #{token}"
      @estado = factor.transicion(token)
      break if @estado < 0
      factor.set_estado(@estado)
    end
    puts "Termino para #{cadena}"
    if (@estado == 4)
      return true
    else
      return false
    end

  end
  def isBloque(cadena)
    load 'Bloque.rb'
    load 'ManejoCadena.rb'
    @estado = 1
    bloque = Bloque.new(@estado)
    array = ManejoCadena.new.separarBloque(cadena)
    puts array.to_s
    array.each do|token|
      @estado = bloque.transicion(token)
      break if @estado < 0
      bloque.set_estado(@estado)
    end
    puts "Termino para #{cadena}"
    if (@estado == 6)
      return true
    else
      return false
    end
  end

  def isTermino(cadena)
      #creamos un objeto de la clase Termino
    load "Termino.rb"
    load 'ManejoCadena.rb'
    @estado = 1
    termino = Termino.new(@estado)
    array = ManejoCadena.new.separarTermino(cadena)#separa la cadena por * y / y devuelve un array con los tokens separados
    puts "Termino: "+array.to_s
    #recorrer el array
    array.each do|token|
      @estado = termino.transicion(token)
      break if @estado < 0
      termino.set_estado(@estado)
    end
    if @estado == 2
    return true
    else
      return false
      end
  end
end


