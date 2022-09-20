//%attributes = {}

var $products : cs:C1710.ProductsSelection
var $product : cs:C1710.ProductsEntity

$products:=ds:C1482.Products.all()

For each ($product; $products)
	
	//$product.price:=5+((Random%10)*5)+((Random%100)*0.1)
	//$product.taxRate:=Choose(Random%3; 5.6; 12.3; 18.5)
	
	$product.thumbnail:=toThumb($product.picture)
	$product.save()
End for each 
