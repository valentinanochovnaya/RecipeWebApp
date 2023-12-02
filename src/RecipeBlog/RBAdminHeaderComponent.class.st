Class {
	#name : #RBAdminHeaderComponent,
	#superclass : #RBHeaderComponent,
	#category : #'RecipeBlog-Components'
}

{ #category : #comparing }
RBAdminHeaderComponent >> createHeaderComponent [
^ self class from: self
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

{ #category : #rendering }
RBAdminHeaderComponent >> renderPublicViewButtonOn: html [
self session isLogged ifTrue: [
html tbsNavbarButton
tbsPullRight;
callback: [ component goToPostListView ];
with: [
html tbsGlyphIcon iconEyeOpen.
html text: ' Public View' ]]
]
