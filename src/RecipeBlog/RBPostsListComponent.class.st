Class {
	#name : #RBPostsListComponent,
	#superclass : #RBScreenComponent,
	#instVars : [
		'currentCategory',
		'postComponents',
		'showLoginError'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #'as yet unclassified' }
RBPostsListComponent >> basicRenderCategoriesOn: html [
html render: self categoriesComponent
]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> basicRenderPostsOn: html [
self readSelectedPosts do: [ :p |
html render: (self postComponentFor: p) ]
]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> categoriesComponent [
^ RBCategoriesComponent
categories: self blog allCategories
postsList: self
]

{ #category : #hooks }
RBPostsListComponent >> children [
^ self postComponents, super children

]

{ #category : #accessing }
RBPostsListComponent >> currentCategory [
^ currentCategory
]

{ #category : #accessing }
RBPostsListComponent >> currentCategory: anObject [
currentCategory := anObject
]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> goToAdministrationView [
self call: RBAdminComponent new
]

{ #category : #testing }
RBPostsListComponent >> hasLoginError [
^ showLoginError ifNil: [ false ]
]

{ #category : #initialization }
RBPostsListComponent >> initialize [
super initialize.
postComponents := OrderedCollection new
]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> loginErrorMessage [
^ 'Incorrect login and/or password'
]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> loginErrorOccurred [
showLoginError := true
]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> postComponentFor: aPost [
^ RBPostComponent new post: aPost
]

{ #category : #accessing }
RBPostsListComponent >> postComponents [
postComponents := self readSelectedPosts
collect: [ :each | RBPostComponent new post: each ].
^ postComponents

]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> readSelectedPosts [
^ self currentCategory
ifNil: [ self blog allVisibleBlogPosts ]
ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self
currentCategory ]

]

{ #category : #rendering }
RBPostsListComponent >> renderCategoryColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 2;
mediumSize: 4;
with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #rendering }
RBPostsListComponent >> renderContentOn: html [
super renderContentOn: html.
html
tbsContainer: [
html tbsRow
showGrid;
with: [ self renderCategoryColumnOn: html.
self renderPostColumnOn: html ] ]
]

{ #category : #rendering }
RBPostsListComponent >> renderLoginErrorMessageIfAnyOn: html [
self hasLoginError ifTrue: [
showLoginError := false.
html tbsAlert
beDanger ;
with: self loginErrorMessage
]

]

{ #category : #rendering }
RBPostsListComponent >> renderPostColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 10;
mediumSize: 8;
with: [
self renderLoginErrorMessageIfAnyOn: html.
self basicRenderPostsOn: html ]

]

{ #category : #'as yet unclassified' }
RBPostsListComponent >> tryConnectionWithLogin: login andPassword:
password [
(login = self blog administrator login and: [
(SHA256 hashMessage: password) = self blog administrator
password ])
ifTrue: [ self goToAdministrationView ]
ifFalse: [ self loginErrorOccurred ]
]
