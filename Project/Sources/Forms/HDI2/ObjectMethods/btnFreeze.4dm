If (Form:C1466.trace)
	TRACE:C157
End if 

CONFIRM:C162("Carry over rows will be frozen too. Are you sure?"; "Freeze formulas"; "Cancel")
If (ok=1)
	WP FREEZE FORMULAS:C1708(WParea2)
End if 

