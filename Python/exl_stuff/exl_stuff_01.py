import xlrd


path = "C:\\Users\\cportelli\\Documents\\Personal\\CASE RPI\\2019_Fall_Environmental_Parametrics\\06 Resources\\xlrdExample.xls"

workbook = xlrd.open_workbook(path)

#name = workbook.name
print (workbook.sheet_names())


