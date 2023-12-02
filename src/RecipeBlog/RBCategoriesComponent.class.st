Class {
	#name : #RBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #'as yet unclassified' }
RBCategoriesComponent class >> categories: categories postsList:
aTBScreen [
^ self new categories: categories; postsList: aTBScreen
]

{ #category : #accessing }
RBCategoriesComponent >> categories [
^ categories
]

{ #category : #accessing }
RBCategoriesComponent >> categories: aCollection [
categories := aCollection asSortedCollection
]

{ #category : #accessing }
RBCategoriesComponent >> postsList [
^ postsList

]

{ #category : #accessing }
RBCategoriesComponent >> postsList: aComponent [
postsList := aComponent

]

{ #category : #rendering }
RBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
html tbsLinkifyListGroupItem
class: 'active' if: aCategory = self postsList currentCategory;
callback: [ self selectCategory: aCategory ];
with: aCategory
]

{ #category : #rendering }
RBCategoriesComponent >> renderContentOn: html [
html tbsListGroup: [
html tbsListGroupItem
with: [ html strong: 'Categories' ].
categories do: [ :cat |
self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #actions }
RBCategoriesComponent >> selectCategory: aCategory [
postsList currentCategory: aCategory

]
