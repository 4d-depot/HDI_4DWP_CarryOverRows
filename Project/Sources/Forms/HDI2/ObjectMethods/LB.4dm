var $productsCol : Collection

If (Form:C1466.trace)
	TRACE:C157
End if 

If (Form:C1466.currentCompany#Null:C1517)  //Form.currentCompany is the currently selected item in the list box
	$invoiceRows:=BuildRndInvoiceRows(Form:C1466.pop.index)
	WP SET DATA CONTEXT:C1786(WParea2; New object:C1471("company"; Form:C1466.currentCompany; "invoiceRows"; $invoiceRows))
	WP COMPUTE FORMULAS:C1707(WParea2)
End if 
