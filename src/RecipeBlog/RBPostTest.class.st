Class {
	#name : #RBPostTest,
	#superclass : #TestCase,
	#category : #'RecipeBlog-Tests'
}

{ #category : #tests }
RBPostTest >> testPostIsCreatedCorrectly [
| post |
post := RBPost
title: 'Welcome to RecipeBlog'
text: 'RecipeBookBlog is a small blog engine made with Pharo.'
category: 'RecipeBlog'.
self assert: post title equals: 'Welcome to RecipeBlog' .
self assert: post text equals: 'RecipeBookBlog is a small blog engine made with Pharo.' .

]

{ #category : #tests }
RBPostTest >> testWithoutCategoryIsGeneral [
| post |
post := RBPost
title: 'Welcome to RecipeBlog'
text: 'RecipeBlog is a small blog engine made with Pharo.'.
self assert: post title equals: 'Welcome to RecipeBlog' .
self assert: post isGeneral.
self deny: post isVisible
]
