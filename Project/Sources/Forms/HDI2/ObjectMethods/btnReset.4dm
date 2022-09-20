If (Form:C1466.trace)
	TRACE:C157
End if 

// reset
WParea2:=ds:C1482.Templates.query("name = :1"; "InvoiceSample")[0].wp
Form:C1466.currentCompany:=Form:C1466.companies.first()
LISTBOX SELECT ROW:C912(*; "LB"; 1)

$invoiceRows:=BuildRndInvoiceRows(Form:C1466.pop.index)
WP SET DATA CONTEXT:C1786(WParea2; New object:C1471("company"; Form:C1466.currentCompany; "invoiceRows"; $invoiceRows))  //Form.currentCompany is the currently selected item in the list box

WP COMPUTE FORMULAS:C1707(WParea2)
