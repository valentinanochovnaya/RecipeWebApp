Class {
	#name : #RBAdminComponent,
	#superclass : #RBScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #hooks }
RBAdminComponent >> children [
^ super children copyWith: self report
]

{ #category : #comparing }
RBAdminComponent >> createHeaderComponent [
^ RBAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
RBAdminComponent >> goToPostListView [
self answer

]

{ #category : #initialization }
RBAdminComponent >> initialize [
super initialize.
self report: (RBPostsReport from: self blog)
]

{ #category : #rendering }
RBAdminComponent >> renderContentOn: html [
super renderContentOn: html.
html tbsContainer: [
html heading: 'Blog Admin'.
html horizontalRule.
html render: self report ]
]

{ #category : #accessing }
RBAdminComponent >> report [
^ report

]

{ #category : #accessing }
RBAdminComponent >> report: aReport [
report := aReport

]
