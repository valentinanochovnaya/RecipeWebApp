Class {
	#name : #RBSession,
	#superclass : #WASession,
	#instVars : [
		'currentAdmin'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #accessing }
RBSession >> currentAdmin [
^ currentAdmin
]

{ #category : #accessing }
RBSession >> currentAdmin: anObject [
currentAdmin := anObject
]

{ #category : #testing }
RBSession >> isLogged [
^ self currentAdmin notNil
]

{ #category : #initialization }
RBSession >> reset [
currentAdmin := nil.
self requestContext redirectTo: self application url.
self unregister.

]
