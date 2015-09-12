class ManejoCadena
  def isDigito(digito)
    digito.match(/[\d]/)
  end
  def isSigno(signo)
    signo.match(/[+|-]/)
  end
  def isNumeroE(e)
    e.match(/[E|e]/)
  end
  def isPunto(punto)
   punto.match(/[.]/)
  end
end

