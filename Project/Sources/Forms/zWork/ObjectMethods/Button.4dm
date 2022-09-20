
//var $product : cs.Products

//$text:=Form.text
$text:=Replace string:C233(Form:C1466.text; ". "; ".")
$text:=Replace string:C233($text; "\r"; "")
Form:C1466.sentences:=Split string:C1554($text; "."; sk ignore empty strings:K86:1)


$i:=0
$es:=ds:C1482.Products.all()
For each ($product; $es)
	$product.Description:=Form:C1466.sentences[$i]
	$product.save()
	
	$i:=$i+1
	If ($i>=(Form:C1466.sentences.length-1))
		$i:=0
	End if 
End for each 