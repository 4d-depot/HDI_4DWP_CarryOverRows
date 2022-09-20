C_TEXT:C284($path)
C_LONGINT:C283($page)
C_PICTURE:C286($pict)

var $bcor : Boolean

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.documents:=ds:C1482.Documents.all().orderBy("pageNumber")
		
		Form:C1466.tabControl:=New object:C1471
		Form:C1466.tabControl.values:=Form:C1466.documents.toCollection("title").extract("title")
		Form:C1466.tabControl.index:=0
		
		WParea1:=Form:C1466.documents[0].comments
		WParea2:=ds:C1482.Templates.query("name = :1"; "InvoiceSample")[0].wp
		
		//
		
		Form:C1466.trace:=False:C215
		
		Form:C1466.pop:=New object:C1471()
		Form:C1466.pop.values:=New collection:C1472("Small"; "Medium"; "Large")
		Form:C1466.pop.index:=2
		
		Form:C1466.InvoiceInfo:=New collection:C1472
		Form:C1466.InvoiceInfo[0]:="This invoice fits in a single page.\rThe carry over rows are not displayed."
		Form:C1466.InvoiceInfo[1]:="This invoice fits in two pages.\rThe carry over row is displayed only on page one."
		Form:C1466.InvoiceInfo[2]:="This invoice fits in many pages.\rThe carry over rows are displayed on every page (except the last one)."
		
		Form:C1466.displayInfo:=Form:C1466.InvoiceInfo[Form:C1466.pop.index]
		
		WP SET VIEW PROPERTIES:C1648(WParea2; New object:C1471(wk formula highlight color:K81:351; "LightYellow"; wk visible references:K81:286; False:C215; wk display formula as symbol:K81:368; True:C214))
		
		// set up the first invoice sample
		
		Form:C1466.companies:=ds:C1482.Companies.all().orderBy("name asc")
		Form:C1466.currentCompany:=Form:C1466.companies.first()
		LISTBOX SELECT ROW:C912(*; "LB"; 1)
		
		$invoiceRows:=BuildRndInvoiceRows(Form:C1466.pop.index)
		WP SET DATA CONTEXT:C1786(WParea2; New object:C1471("company"; Form:C1466.currentCompany; "invoiceRows"; $invoiceRows))  //Form.currentCompany is the currently selected item in the list box
		
		WP COMPUTE FORMULAS:C1707(WParea2)
		
		
		
		
		//SET TIMER(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		//SET TIMER(0)
		
		//WP SET DATA CONTEXT(WParea2; New object("company"; Form.companies[0]))
		//WP COMPUTE FORMULAS(WParea2)
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$page:=FORM Get current page:C276
		WParea1:=Form:C1466.documents[$page-1].comments
		
		// reset
		WParea2:=ds:C1482.Templates.query("name = :1"; "InvoiceSample")[0].wp
		Form:C1466.currentCompany:=Form:C1466.companies.first()
		LISTBOX SELECT ROW:C912(*; "LB"; 1)
		
		$invoiceRows:=BuildRndInvoiceRows(Form:C1466.pop.index)
		WP SET DATA CONTEXT:C1786(WParea2; New object:C1471("company"; Form:C1466.currentCompany; "invoiceRows"; $invoiceRows))  //Form.currentCompany is the currently selected item in the list box
		
		WP COMPUTE FORMULAS:C1707(WParea2)
		
		
		
		
		
		
		
		WP GET ATTRIBUTES:C1345(WParea2; wk bottom carry over row:K81:371; $bcor)
		Form:C1466.btmCOR:=$bcor
		
End case 
