rendering
renderContentOn: html
	html div
		class: #nestedList;
		with: [ 
					self flag: #TODO.	"put style in css"
					self displayResearchFieldDiv: html.
					html div
						class: #listContent;
						style: 'height: 500px;';
						with: [ self renderListOn: html ] ]