rendering
renderItemContentOf: aNode index: anIndex indentedBy: anInteger on: html
	| anId |
	anId := html nextId.
	html div
		class: #itemContener;
		attributeAt: 'draggable' put: 'true';
		attributeAt: 'onDragOver' put: 'if("' , anIndex asString , '" != event.dataTransfer.getData("sourceIndex")) {event.preventDefault();}';
		attributeAt: 'ondrop' put: 'dropListItem(event, "' , anIndex asString , '");';
		attributeAt: 'ondragstart' put: 'dragListItem(event,"' , anIndex asString , '")';
		style: 'padding-left: ' , (15 * anInteger) asString , 'px;';
		class: #isSelected if: aNode selectedElement;
		with: [ 
					html anchor
						onClick: 'goTo("' , anIndex asString , '");' if: self actionBlock notNil;
						with: [ 
									self renderIconOf: aNode element on: html.
									html span
										class: #item;
										id: anId;
										with: [ html text: (self format value: aNode element) ] ].
					aNode children
						ifNotEmpty: [ 
							html div
								onClick: 'expandCollapse(this)';
								class: #icon ] ].
	self renderHelpOf: aNode element at: anId on: html