//%attributes = {}
#DECLARE($size : Integer)->$invoiceRows : cs:C1710.InvoiceRowsSelection

var $products : cs:C1710.ProductsSelection
var $product : cs:C1710.ProductsEntity
var $invoiceRow : cs:C1710.InvoiceRowsEntity

var $o : Object
var $i; $n; $p : Integer



// remove all existing InvoiceRows
ds:C1482.InvoiceRows.all().drop()


$products:=ds:C1482.Products.all()

$n:=Choose:C955($size; (5+(Random:C100%5)); (20+(Random:C100%6)); (50+(Random:C100%10)))
For ($i; 1; $n)
	
	// pick a random product
	$p:=Random:C100%$products.length
	$product:=$products[$p]
	
	// create a fake invoice row
	$invoiceRow:=ds:C1482.InvoiceRows.new()
	
	$invoiceRow.reference:=$product.reference
	$invoiceRow.name:=$product.name
	$invoiceRow.thumbnail:=$product.thumbnail
	$invoiceRow.price:=$product.price
	$invoiceRow.taxRate:=$product.taxRate
	$invoiceRow.description:=$product.description
	
	
	$invoiceRow.quantity:=(Random:C100%3)+1
	$invoiceRow.priceVAT:=$invoiceRow.price+($invoiceRow.price*$invoiceRow.taxRate/100)
	$invoiceRow.totalPrice:=$invoiceRow.priceVAT*$invoiceRow.quantity
	
	$invoiceRow.save()
	
End for 

$invoiceRows:=ds:C1482.InvoiceRows.all()



