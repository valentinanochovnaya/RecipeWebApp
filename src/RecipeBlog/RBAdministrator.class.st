Class {
	#name : #RBAdministrator,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #'RecipeBlog-Model'
}

{ #category : #'as yet unclassified' }
RBAdministrator class >> login: login password: password [
^ self new
login: login;
password: password;
yourself

]

{ #category : #accessing }
RBAdministrator >> login [
^ login

]

{ #category : #accessing }
RBAdministrator >> login: anObject [
login := anObject

]

{ #category : #accessing }
RBAdministrator >> password [
^ password

]

{ #category : #accessing }
RBAdministrator >> password: anObject [
password := SHA256 hashMessage: anObject
]
