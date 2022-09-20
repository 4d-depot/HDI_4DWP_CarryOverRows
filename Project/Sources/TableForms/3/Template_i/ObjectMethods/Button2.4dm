var $invoiceRows : cs:C1710.InvoiceRowsSelection
var $companies : cs:C1710.CompaniesSelection
var $company : cs:C1710.CompaniesEntity
var $n : Integer

$companies:=ds:C1482.Companies.all()
$n:=$companies.length

$company:=$companies[Random:C100%$n]
If (Shift down:C543)
	$invoiceRows:=BuildRndInvoiceRows(1)
Else 
	$invoiceRows:=BuildRndInvoiceRows(0)
End if 

WP SET DATA CONTEXT:C1786([Templates:3]wp:3; New object:C1471("company"; $company; "invoiceRows"; $invoiceRows))
WP COMPUTE FORMULAS:C1707([Templates:3]wp:3)

