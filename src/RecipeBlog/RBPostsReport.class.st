Class {
	#name : #RBPostsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #'as yet unclassified' }
RBPostsReport class >> filteredDescriptionsFrom: aBlogPost [
"Filter only some descriptions for the report columns."
^ aBlogPost magritteDescription
select: [ :each | #(title category date) includes: each accessor
selector ]

]

{ #category : #'instance creation' }
RBPostsReport class >> from: aBlog [
| report blogPosts |
blogPosts := aBlog allBlogPosts.
report := self rows: blogPosts description: (self
filteredDescriptionsFrom: blogPosts anyOne).
report blog: aBlog.
report addColumn: (MACommandColumn new
addCommandOn: report selector: #viewPost: text: 'View';
yourself;
addCommandOn: report selector: #editPost: text: 'Edit';
yourself;
addCommandOn: report selector: #deletePost: text: 'Delete';
yourself).
^ report
]

{ #category : #adding }
RBPostsReport >> addPost [
| post |
post := self call: (self renderAddPostForm: RBPost new).
post
ifNotNil: [ blog writeBlogPost: post.
self refreshReport ]
]

{ #category : #accessing }
RBPostsReport >> blog [
^ blog

]

{ #category : #accessing }
RBPostsReport >> blog: aRBBlog [
blog := aRBBlog

]

{ #category : #'as yet unclassified' }
RBPostsReport >> deletePost: aPost [
(self confirm: 'Do you want remove this recipe ?')
ifTrue: [ blog removeBlogPost: aPost.
self refreshReport ]
]

{ #category : #'as yet unclassified' }
RBPostsReport >> editPost: aPost [
| post |
post := self call: (self renderEditPostForm: aPost).
post ifNotNil: [ blog save ]
]

{ #category : #'as yet unclassified' }
RBPostsReport >> refreshReport [
self rows: blog allBlogPosts.
self refresh.

]

{ #category : #rendering }
RBPostsReport >> renderAddPostForm: aPost [
^ aPost asComponent
addDecoration: (TBSMagritteFormDecoration buttons: { #save
-> 'Add recipe' . #cancel -> 'Cancel'});
yourself

]

{ #category : #rendering }
RBPostsReport >> renderContentOn: html [
html tbsGlyphIcon iconPlus.
html anchor
callback: [ self addPost ];
with: 'Add recipe'.
super renderContentOn: html
]

{ #category : #rendering }
RBPostsReport >> renderEditPostForm: aPost [
^ aPost asComponent addDecoration: (
TBSMagritteFormDecoration buttons: {
#save -> 'Save recipe'.
#cancel -> 'Cancel'});
yourself

]

{ #category : #rendering }
RBPostsReport >> renderViewPostForm: aPost [
^ aPost asComponent
addDecoration: (TBSMagritteFormDecoration buttons: { #cancel
-> 'Back' });
readonly: true;
yourself

]

{ #category : #'as yet unclassified' }
RBPostsReport >> viewPost: aPost [
self call: (self renderViewPostForm: aPost)
]
