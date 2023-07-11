#parenthesis groupexpresion operation (...)
#may contain either simple expression or simple pipeline, may not contain statements like while loop
(2+2)* 3 (Get.Date).DayOfWeek
#pipe line: command in parenthesis can be used as value in expresion
(Get-ChildItem).count
#subexpresions group collections of statements, one value=one value, more values=array
$($p = "a*"; Get-Process $p)

#array subexpresion operator =same behavior as the subexpresion but result is always an array
@(dir c:\; dir d:\)
