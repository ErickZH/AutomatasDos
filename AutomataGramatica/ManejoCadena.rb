
class ManejoCadena

  def isDigito(digito)
   digito.match(/[\d]/)
  end

  def isSigno(simbolo)
    simbolo = simbolo.to_s
    if(simbolo.match(/[-+]/))
      return true
    else
      return false
    end
  end
  def isIgual(cadena)
    cadena.match(/[=]/)
  end
  def isNumeroE(e)
   e.match(/[E|e]/)
  end
  def isPunto(punto)
   punto.match(/[.]/)
  end
  def isLetra(letra)
   letra.match(/[[aA-zZ]]/)
  end
  #def separaTokens(separador)
   # separador.each_char do|i|
    #  @cadena = @cadena.gsub(i," "+i+" ")
    #end
    #array=@cadena.split(" ")
  #end
  def isOperadorPorEntre(simbolo)
    if(simbolo.match(/[*]/))||simbolo.match(/[\/]/)
      return true
    else
      return false
    end
  end
  def isPuntoYComa(cadena)
    cadena.match(/[;]/)
  end
  def isComa(cadena)
    cadena.match(/[,]/)
  end

  def isProcedure(cadena)
    if cadena.match(/procedure/)
      return true
    else
      return false
    end
  end
  def is_var(cadena)
    if cadena.match(/var/)
      return true
    else
      return false
    end
  end
  def is_const(cadena)
    if cadena.match(/const/)
      return true
    else
      return false
    end
  end
  def is_then(cadena)
    if cadena.match(/then/)
      return true
    else
      return false
    end
  end
  def is_do(cadena)
    if cadena.match(/do/)
      return true
    else
      return false
    end
  end
  def is_end(cadena)
    if cadena.match(/end/)
      return true
    else
      return false
    end
  end

  def isCall(cadena)
    if cadena.match(/call/)
      return true
    else
      return false
    end
  end

  def isBegin(cadena)
    if cadena.match(/begin/)
        return true
    else
      return false
    end
  end
  def is_if(cadena)
    if cadena.match(/if/)
      return true
    else
      return false
    end
  end

  def is_odd(cadena)
    if cadena.match(/odd/)
      return true
    else
      return false
    end
  end
  def is_while(cadena)
    if cadena.match(/while/)
      return true
    else
      return false
    end
  end
  def isOdd(cadena)
    if cadena.match(/odd/)
      return true
    else
      return false
    end
  end

  def isOperadorLogico(cadena)
    if cadena.match(/[=]/)
      return true
    elsif cadena.match(/[!][=]/)
      return true
    elsif cadena.match(/[<]/)
      return true
    elsif cadena.match(/[>]/)
      return true
    elsif cadena.match(/[<][=]/)
      return true
    elsif cadena.match(/[>][=]/)
      return true
    else
      return false
    end
  end

  def isOperador(cadena)
    if cadena.match(/^[*|\/]/)
      puts "operador"
      return true
    elsif cadena.match(/[&]/)
      puts "operador y"
      return true
    elsif cadena.match(/[%]/)
      puts "operador mod"
      return true
    elsif cadena.match(/[D][I][V]/)
      puts "operador div"
      return true
    elsif cadena.match(/[!]/)
      puts "operador not"
      return true

    elsif cadena.match(/[|]/)
      puts "operador OR"
      return true
    else
      return false
    end
  end
  def esIgual(simbolo)
    return simbolo =~/^[=]/
  end
  def isParentesisDerecho(simbolo)
    return simbolo.match(/^[(]/)
  end
  def isParentesisIzquierdo(simbolo)
    return simbolo.match(/[)]/)
  end

  #def separarTermino
   # @cadena = @cadena.gsub("*", " * ")
    #@cadena = @cadena.gsub("/", " / ")
   # @cadena = @cadena.gsub("DIV", " DIV ")
    #@cadena = @cadena.gsub("MOD", " MOD ")
    #@cadena = @cadena.gsub("AND", " AND ")
    #array = @cadena.split(" ")
    #return array
  #end

  def separarFactor(cadena)
    cadena = cadena.gsub(" ","")
    cadena=cadena.gsub("(", " ( ")
    cadena=cadena.gsub(")", " ) ")
    cadena = cadena.gsub("!", " ! ")

    array = cadena.split(" ")
    return array
  end

  def separarExpresion(cadena)
    separador = Array.new
    token = obtenerParentesisTermino(cadena)
    token.each { |simbolo|
      if(simbolo.match(/[(].+[)]/))
        separador.push(simbolo)
      else
        simbolo = simbolo.gsub(/[+]/," + ")
        simbolo = simbolo.gsub(/[-]/," - ")
        a = simbolo.split(" ")
        separador.push(a)
      end
    }

    separador = separador.join(" ")
    separador = separador.split(" ")
    return separador
  end

  def separarTermino(cadena)
    separador = Array.new
    token = obtenerParentesisTermino(cadena)
    token.each { |simbolo|

      if(simbolo.match(/[(].+[)]/))
        separador.push(simbolo)
      else
        simbolo = simbolo.gsub(/[*]/," * ")
        simbolo = simbolo.gsub(/[\/]/," / ")
        simbolo = simbolo.gsub(/[&]/," & ")
        simbolo = simbolo.gsub(/[D][I][V]/," DIV ")
        simbolo = simbolo.gsub(/[%]/," % ")
        a = simbolo.split(" ")
        separador.push(a)
      end
    }
    separador = separador.join(" ")
    separador = separador.split(" ")
    return separador
  end


  def separarCondicion(cadena)
    cadena = cadena.gsub(" ","")
    cadena = cadena.gsub(/odd/," odd ")
    cadena = cadena.gsub(/==/," == ")
    cadena = cadena.gsub(/!=/," != ")
    cadena = cadena.gsub(/>/," > ")
    cadena = cadena.gsub(/</," < ")
    cadena = cadena.gsub(/[<]\s*[=]/," <= ")
    cadena = cadena.gsub(/[>]\s*[=]/," >= ")
    return cadena.split(" ")

  end

  def separarInstruccion(cadena)

    #puts "separando instruccion: #{cadena}".center(80,"*")
    cadena = cadena.gsub(" ","")
    if cadena.match(/call.*/)
      cadena = cadena.sub(/call/," call ")
    elsif cadena.match(/^begin/)
      return separarComasBegin(cadena)
    elsif cadena.match(/^if.*then.*/)
      cadena = cadena.sub(/if/," if ")
      cadena = cadena.sub(/then/," then ")
    elsif cadena.match(/^while.*do.*/)
      cadena = cadena.sub(/while/," while ")
      cadena = cadena.sub(/do/," do ")
    else
      cadena = cadena.sub(/:=/," := ")
    end
    return cadena.split(" ")
  end
  def separarComasBegin(cadena)

    arregloSeparado = Array.new

    if cadena.match(/^begin/)
      cadena = cadena.sub("begin","begin°")
      cadena =cadena.sub(/end$/, "°end°")
      if cadena.match(/.*begin.*end/)
        cadena = cadena.gsub(/begin/,"°begin")
        cadena = cadena.gsub(/end/,"end°")
      end
    end
    array = cadena.split("°")

    #puts array.to_s

    for i in 0..array.length-1
      if array[i]!=""
        if array[i].match(/^begin.*end$/)
          arregloSeparado.push(array[i])
        elsif array[i].match(/^begin|^end/)
          array[i] = array[i].gsub("begin","begin°")
          array[i] = array[i].gsub("end","°end°")
          arregloSeparado.push(array[i])
        elsif
        array[i] = array[i].gsub(";","°;°")
          arregloSeparado.push(array[i])
        end
      end
    end

    aux = arregloSeparado.join("")
    arregloSeparado = aux.split("°")

    return arregloSeparado

  end



  def isNada(cadena)
    if cadena.length == 0
      return true
    else
      return false
    end
  end

  def isOperadorAsignacion(cadena)
    if cadena.match(/^[:][=]/)
      return true
    else
      return false
    end
  end
  def separarBloque(cadena)
    cadena = cadena.gsub(" ","")
    cadena = cadena.gsub(/const/," const ")
    cadena = cadena.gsub(/var/," var ")
    cadena = cadena.gsub(/procedure/," procedure ")
    cadena = cadena.gsub(/[=]/," = ")
    cadena = cadena.gsub(/[;]/," ; ")
    cadena = cadena.gsub(/[,]/," , ")
    return cadena.split(" ")

  end

  def separarCodigo(cadena)
    cadena = cadena.gsub("\t","")
    puts "CADENA AL ENTRAR A SEPARAR CODIGO: #{cadena}"
    array = cadena.split("\n")
    puts "CADENA DESPUES DE SPLIT #{array.to_s}"
    cadena = Array.new
    i=0
    begin
    while i<array.length
      contenido = array[i]
      if contenido.match(/^const|^var|^procedure/)
        cadena.push(contenido)
      elsif contenido.match(/^begin.*end$/)
        cadena.push(contenido)
      elsif contenido.match(/^begin/)
        nuevoBegin = encontrarEnd(array,i+1)
        i=nuevoBegin[1]
        cadena.push(contenido+" "+nuevoBegin[0])
      elsif contenido.match(/^call|^if|^while|.*:=.*/)
        cadena.push(contenido)
      else
        cadena.push(contenido.gsub("\n",""))
      end
      i+=1
    end
    return cadena
    rescue Exception => e
      puts "EXCEPTION : "+ e.message.to_s
      return a = []
    end

  end



  def encontrarEnd(array,i)
    cadena = Array.new
    j=i
    begin
    while j<array.length
      contenido = array[j]
      if contenido.match(/^begin/)
        nuevoBegin = encontrarEnd(array,j+1)
        j = nuevoBegin[1]
        cadena.push(contenido.to_s+" "+nuevoBegin[0].to_s)
      elsif contenido.match(/end/)
        contenido = contenido.gsub("\n","")
        if j==i
          return c = [cadena,j]
        else
          cadena.push(contenido)
          cadena = cadena.join(" ")
          return c = [cadena,j]
        end
      else
        contenido = contenido.gsub("\n","")
        cadena.push(contenido)
      end
      j+=1
    end
    rescue Exception => e
      puts "EXCEPCION  2"+ e.message.to_s
      return c = [cadena,j]
    end
  end


  def separarParentesis(cadena)
    cadena = cadena.gsub(" ","")
    cadena = cadena.gsub(/[(]/," ( ")
    cadena = cadena.gsub(/[)]/," ) ")
    return cadena.split(" ")
  end

  def contieneParentesis(cadena)
    if cadena.match(/([(].+[)])/)
      return true
    else
      false
    end
  end

  def obtenerParentesisExpresion(cadena)
    cadena = cadena.gsub("("," (")
    cadena = cadena.gsub(")",") ")
    return cadena.split(" ")
  end

  def obtenerParentesisTermino(cadena)
    cadena = cadena.gsub("("," (")
    cadena = cadena.gsub(")",") ")
    return cadena.split(" ")
  end


end