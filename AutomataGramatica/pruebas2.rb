cadena = "begin a := x; b := y; z := 0; while b > 0 do begin if odd b then z := 2 + a; a := z * a; b := b / 2; end end"

puts cadena.sub!(/begin/,"begin°")
puts cadena.sub!(/end$/,"°end")
#cadena = cadena.scan(//)

cadena = cadena.split("°")
puts cadena.to_s

