var $product : cs:C1710.ProductsEntity
var $o : Object

Form:C1466.rndProducts:=New collection:C1472

$es:=ds:C1482.Products.all()
For ($i; 1; 100)
	$p:=Random:C100%$es.length
	
	$product:=$es[$p]
	
	$o:=$product.toObject()
	$o.quantity:=(Random:C100%3)+1
	
	Form:C1466.rndProducts.push($o)
	
End for 


