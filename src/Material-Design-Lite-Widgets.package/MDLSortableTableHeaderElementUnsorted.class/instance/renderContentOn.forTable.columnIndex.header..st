rendering
renderContentOn: html forTable: table columnIndex: i header: header
	(header headingCellOn: html)
		onClick:
				(html jQuery ajax
						callback: [ 
									table sortAscendingAtRow: i.
									header goToNextState ];
						onSuccess: (table ajaxUpdateScriptFrom: html));
		with: header element