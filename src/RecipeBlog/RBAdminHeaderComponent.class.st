Class {
	#name : #RBAdminHeaderComponent,
	#superclass : #RBHeaderComponent,
	#category : #'RecipeBlog-Components'
}

{ #category : #comparing }
RBAdminHeaderComponent >> createHeaderComponent [
^ RBAdminHeaderComponent from: self
]

{ #category : #rendering }
RBAdminHeaderComponent >> renderButtonsOn: html [
html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
RBAdminHeaderComponent >> renderDisconnectButtonOn: html [
html tbsNavbarButton
tbsPullRight;
callback: [ component goToPostListView ];
with: [
html text: 'Disconnect '.
html tbsGlyphIcon iconLogout ]

]
