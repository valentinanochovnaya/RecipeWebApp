Class {
	#name : #RBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #testing }
RBApplicationRootComponent class >> canBeRoot [
^ true

]

{ #category : #'class initialization' }
RBApplicationRootComponent class >> initialize [
"self initialize"
| app |
app := WAAdmin register: self asApplicationAt: 'RecipeBlog'.
app
addLibrary: JQDeploymentLibrary;
addLibrary: JQUiDeploymentLibrary;
addLibrary: TBSDeploymentLibrary
]

{ #category : #hooks }
RBApplicationRootComponent >> children [
^ { main }

]

{ #category : #comparing }
RBApplicationRootComponent >> initialize [
super initialize.
main := RBPostsListComponent new
]

{ #category : #accessing }
RBApplicationRootComponent >> main: aComponent [
main := aComponent

]

{ #category : #rendering }
RBApplicationRootComponent >> renderContentOn: html [
html render: main

]

{ #category : #updating }
RBApplicationRootComponent >> updateRoot: anHtmlRoot [
super updateRoot: anHtmlRoot.
anHtmlRoot beHtml5.
anHtmlRoot title: 'RecipeBlog'

]
