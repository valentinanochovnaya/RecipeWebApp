Class {
	#name : #RBAdminComponent,
	#superclass : #RBScreenComponent,
	#category : #'RecipeBlog-Components'
}

{ #category : #'as yet unclassified' }
RBAdminComponent >> goToPostListView [
self answer
]

{ #category : #rendering }
RBAdminComponent >> renderContentOn: html [
super renderContentOn: html.
html tbsContainer: [
html heading: 'Blog Admin'.
html horizontalRule ]

]
