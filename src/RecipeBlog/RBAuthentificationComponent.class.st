Class {
	#name : #RBAuthentificationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #'instance creation' }
RBAuthentificationComponent class >> from: aComponent [
^ self new
component: aComponent;
yourself
]

{ #category : #accessing }
RBAuthentificationComponent >> account [
^ account

]

{ #category : #accessing }
RBAuthentificationComponent >> account: anObject [
account := anObject

]

{ #category : #accessing }
RBAuthentificationComponent >> component [
^ component

]

{ #category : #accessing }
RBAuthentificationComponent >> component: anObject [
component := anObject

]

{ #category : #accessing }
RBAuthentificationComponent >> password [
^ password

]

{ #category : #accessing }
RBAuthentificationComponent >> password: anObject [
password := anObject

]

{ #category : #rendering }
RBAuthentificationComponent >> renderAccountFieldOn: html [
html
tbsFormGroup: [ html label with: 'Account'.
html textInput
tbsFormControl;
attributeAt: 'autofocus' put: 'true';
callback: [ :value | account := value ];
value: account ]
]

{ #category : #rendering }
RBAuthentificationComponent >> renderBodyOn: html [
html
tbsModalBody: [
html tbsForm: [
self renderAccountFieldOn: html.
self renderPasswordFieldOn: html.
html tbsModalFooter: [ self renderButtonsOn: html ]
] ]
]

{ #category : #rendering }
RBAuthentificationComponent >> renderButtonsOn: html [
html tbsButton
attributeAt: 'type' put: 'button';
attributeAt: 'data-dismiss' put: 'modal';
beDefault;
value: 'Cancel'.
html tbsSubmitButton
bePrimary;
callback: [ self validate ];
value: 'SignIn'

]

{ #category : #rendering }
RBAuthentificationComponent >> renderContentOn: html [
html tbsModal
id: 'myAuthDialog';
with: [
html tbsModalDialog: [
html tbsModalContent: [
self renderHeaderOn: html.
self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
RBAuthentificationComponent >> renderHeaderOn: html [
html
tbsModalHeader: [
html tbsModalCloseIcon.
html tbsModalTitle
level: 4;
with: 'Authentication' ]
]

{ #category : #rendering }
RBAuthentificationComponent >> renderPasswordFieldOn: html [
html tbsFormGroup: [
html label with: 'Password'.
html passwordInput
tbsFormControl;
callback: [ :value | password := value ];
value: password ]
]

{ #category : #accessing }
RBAuthentificationComponent >> validate [
^ component tryConnectionWithLogin: self account andPassword: self
password

]
