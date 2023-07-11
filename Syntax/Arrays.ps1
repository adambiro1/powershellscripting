#creating an epmty Arrays
@()
#creating an silgleton Arrays
@(1) #or (,1) rather use with @

#array operatos
$a = (((1,2),(3,4)),((5,6),(7,8)))

#range operator
1..5 #is same as 1,2,3,4,5

#for bigger and more effective array manipulation use arraylist
#moddules like .add() .remove() only work on arraylist
$myarraylist = [System.Collections.ArrayList]@('blue','yellow','green','black')