Class {
	#name : #RBPostsReport,
	#superclass : #TBSMagritteReport,
	#category : #'RecipeBlog-Components'
}

{ #category : #'instance creation' }
RBPostsReport class >> from: aBlog [
| allBlogs |
allBlogs := aBlog allBlogPosts.
^ self rows: allBlogs description: allBlogs anyOne
magritteDescription 

]
