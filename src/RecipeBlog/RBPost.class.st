"
RBPost
"
Class {
	#name : #RBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible',
		'photoPath'
	],
	#category : #'RecipeBlog-Model'
}

{ #category : #'as yet unclassified' }
RBPost class >> generalTag [
	^ 'General'
]

{ #category : #'as yet unclassified' }
RBPost class >> title: aTitle text: aText [
	^ self new
	title: aTitle;
	text: aText;
	yourself

]

{ #category : #'as yet unclassified' }
RBPost class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText)
	category: aCategory;
	yourself
]

{ #category : #'as yet unclassified' }
RBPost class >> title: aTitle text: aText category: aCategory photoPath: aPhotoPath [ 
	^ (self title: aTitle text: aText)
	category: aCategory;
	photoPath: aPhotoPath;
	yourself
]

{ #category : #action }
RBPost >> beVisible [
self visible: true
]

{ #category : #accessing }
RBPost >> category [
	^ category
]

{ #category : #accessing }
RBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
RBPost >> date [
	^ date
]

{ #category : #accessing }
RBPost >> date: aDate [
	date := aDate
]

{ #category : #initialization }
RBPost >> initialize [
	super initialize.
	self category: self class generalTag.
	self date: Date today.
	self notVisible
]

{ #category : #testing }
RBPost >> isGeneral [
^ self category = self class generalTag 
]

{ #category : #testing }
RBPost >> isVisible [
^ self visible
]

{ #category : #action }
RBPost >> notVisible [
self visible: false
]

{ #category : #accessing }
RBPost >> photoPath [
	^ photoPath
]

{ #category : #accessing }
RBPost >> photoPath: anObject [
	photoPath := anObject
]

{ #category : #accessing }
RBPost >> text [
	^ text
]

{ #category : #accessing }
RBPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
RBPost >> title [
	^ title
]

{ #category : #accessing }
RBPost >> title: anObject [
	title := anObject
]

{ #category : #accessing }
RBPost >> visible [
	^ visible
]

{ #category : #accessing }
RBPost >> visible: aBoolean [
	visible := aBoolean
]
