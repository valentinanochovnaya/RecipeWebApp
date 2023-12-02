Class {
	#name : #RBHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #'instance creation' }
RBHeaderComponent class >> from: aComponent [
^ self new
component: aComponent;
yourself

]

{ #category : #accessing }
RBHeaderComponent >> component [
^ component

]

{ #category : #accessing }
RBHeaderComponent >> component: anObject [
component := anObject
]

{ #category : #rendering }
RBHeaderComponent >> renderBrandOn: html [
html tbsNavbarHeader: [
html tbsNavbarBrand
url: self application url;
with: 'RecipeBlog' ]
]

{ #category : #rendering }
RBHeaderComponent >> renderButtonsOn: html [
self session isLogged
ifTrue: [ self renderSimpleAdminButtonOn: html ]
ifFalse: [ self renderModalLoginButtonOn: html ]
]

{ #category : #rendering }
RBHeaderComponent >> renderContentOn: html [
html tbsNavbar beDefault; with: [
html tbsContainer: [
self renderBrandOn: html.
self renderButtonsOn: html
]]

]

{ #category : #rendering }
RBHeaderComponent >> renderModalLoginButtonOn: html [
html render: (RBAuthentificationComponent from: component).
html tbsNavbarButton
tbsPullRight;
attributeAt: 'data-target' put: '#myAuthDialog';
attributeAt: 'data-toggle' put: 'modal';
with: [
html tbsGlyphIcon iconLock.
html text: ' Login' ]
]

{ #category : #rendering }
RBHeaderComponent >> renderSimpleAdminButtonOn: html [
html form: [
html tbsNavbarButton
tbsPullRight;
callback: [ component goToAdministrationView ];
with: [
html tbsGlyphIcon iconListAlt.
html text: ' Admin Mode' ]]
]
