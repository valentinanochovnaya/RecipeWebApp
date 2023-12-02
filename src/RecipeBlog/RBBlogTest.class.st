Class {
	#name : #RBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first',
		'previousRepository'
	],
	#category : #'RecipeBlog-Tests'
}

{ #category : #running }
RBBlogTest >> setUp [
previousRepository := VORepository current.
VORepository setRepository: VOMemoryRepository new.
blog := RBBlog current.
first := RBPost title: 'A title' text: 'A text' category: 'First
Category'.
blog writeBlogPost: first.
post := (RBPost title: 'Another title' text: 'Another text'
category: 'Second Category') beVisible
]

{ #category : #running }
RBBlogTest >> tearDown [
VORepository setRepository: previousRepository
]

{ #category : #tests }
RBBlogTest >> testAddBlogPost [
blog writeBlogPost: post.
self assert: blog size equals: 2
]

{ #category : #tests }
RBBlogTest >> testAllBlogPosts [
blog writeBlogPost: post.
self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
RBBlogTest >> testAllBlogPostsFromCategory [
self assert: (blog allBlogPostsFromCategory: 'First Category')
size equals: 1

]

{ #category : #tests }
RBBlogTest >> testAllCategories [
blog writeBlogPost: post.
self assert: blog allCategories size equals: 2
]

{ #category : #tests }
RBBlogTest >> testAllVisibleBlogPosts [
blog writeBlogPost: post.
self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
RBBlogTest >> testAllVisibleBlogPostsFromCategory [
blog writeBlogPost: post.
self assert: (blog allVisibleBlogPostsFromCategory: 'First
Category') size equals: 0.
self assert: (blog allVisibleBlogPostsFromCategory: 'Second
Category') size equals: 1

]

{ #category : #tests }
RBBlogTest >> testGeneralBlogPosts [
self assert: (blog allBlogPosts select: [ :p | p isGeneral
]) size equals: 0
]

{ #category : #tests }
RBBlogTest >> testRemoveAllBlogPosts [
blog removeAllPosts.
self assert: blog size equals: 0
]

{ #category : #tests }
RBBlogTest >> testSize [
self assert: blog size equals: 1
]
