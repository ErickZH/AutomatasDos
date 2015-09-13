require 'spreadsheet'
book = Spreadsheet.open('Errores2.xls')
sheet1 = book.worksheet 0 # can use an index or worksheet name
#sheet1.each do |row|
 # break if row[0].nil? # if first cell empty
 #puts row
  #puts row.join(',') # looks like it calls "to_s" on each cell's Value
#end
0.upto(sheet1.last_row_index) do|i|
  if sheet1.cell(i,0) == -2
    puts sheet1.cell(i,1)
  end
end