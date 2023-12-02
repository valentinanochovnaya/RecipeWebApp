Class {
	#name : #RBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'component'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #comparing }
RBScreenComponent >> > createHeaderComponent [
^ RBHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
RBScreenComponent >> blog [
"Return the current blog. In the future we will ask the
session to return the blog of the currently logged in user."
^ RBBlog current
]

{ #category : #hooks }
RBScreenComponent >> children [
^ { header }
]

{ #category : #comparing }
RBScreenComponent >> createHeaderComponent [
^ RBHeaderComponent from: self
]

{ #category : #initialization }
RBScreenComponent >> initialize [
super initialize.
header := self createHeaderComponent
]

{ #category : #rendering }
RBScreenComponent >> renderContentOn: html [
html render: header
]
