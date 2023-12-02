"
RBBlog
"
Class {
	#name : #RBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#category : #'RecipeBlog-Model'
}

{ #category : #'as yet unclassified' }
RBBlog class >> createDemoPosts [
"RBBlog createDemoPosts"
self current
writeBlogPost: ((RBPost title: 'Mini Philly Cheesesteaks' text:
'Miniaturized sandwiches dont usually float my boat, as they are almost always not as good as the full-sized versions. But this mini Philly cheesesteak recipe captures everything I love about the classic.' category:
'Meat' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Greek-Beef-Pitas_exps71838_SD143204B12_04_1bC_RMS.jpg?fit=700%2C1024') visible: true);
writeBlogPost: ((RBPost title: 'Berry-Beet Salad' text:
'Here is a delightfully different salad that balances the earthy flavor of beets with the natural sweetness of berries. If you prefer, substitute crumbled feta for the goat cheese. —Amy Lyons, Mounds View, Minnesota'
category: 'Salad' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Greek-Beef-Pitas_exps71838_SD143204B12_04_1bC_RMS.jpg?fit=700%2C1024') visible: true);
writeBlogPost: ((RBPost title: 'Apple-Honey Dutch Baby.' text: 'I love to make this treat on Sunday morning. It is so impressive when it is served warm right out of the oven...and the apple honey filling is yummy! —Kathy Fleming, Lisle, Illinois'
category: 'Bakery' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Greek-Beef-Pitas_exps71838_SD143204B12_04_1bC_RMS.jpg?fit=700%2C1024') visible: true);
writeBlogPost: ((RBPost title: 'Mini-Chip Cocoa Pancakes' text: 'Whip up a batch of cocoa pancakes dotted with mini chocolate chips to satisfy your chocolate cravings first thing in the morning. Yum! —Joyce Moynihan, Lakeville, Minnesota' category: 'Breakfast' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Greek-Beef-Pitas_exps71838_SD143204B12_04_1bC_RMS.jpg?fit=700%2C1024') visible: true);
writeBlogPost: ((RBPost title: 'Greek Beef Pitas' text: 'A local restaurant that is famous for pitas inspired me to make my own Greek-style sandwiches at home. Feel free to add olives if you would like. —Nancy Sousley, Lafayette, Indiana.' category: 'Breakfast' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Greek-Beef-Pitas_exps71838_SD143204B12_04_1bC_RMS.jpg?fit=700%2C1024') visible: true)

]

{ #category : #accessing }
RBBlog class >> current [
^ self selectAll
ifNotEmpty: [ :x | x anyOne ]
ifEmpty: [ self new save ]
]

{ #category : #'class initialization' }
RBBlog class >> initialize [
self reset

]

{ #category : #initialization }
RBBlog class >> initializeVoyageOnMemoryDB [
VOMemoryRepository new enableSingleton
]

{ #category : #testing }
RBBlog class >> isVoyageRoot [
"Indicates that instances of this class are top level documents
in noSQL databases"
^ true

]

{ #category : #initialization }
RBBlog class >> reset [
self initializeVoyageOnMemoryDB
]

{ #category : #'as yet unclassified' }
RBBlog >> allBlogPosts [
^ posts

]

{ #category : #'as yet unclassified' }
RBBlog >> allBlogPostsFromCategory: aCategory [
^ posts select: [ :p | p category = aCategory ]
]

{ #category : #'as yet unclassified' }
RBBlog >> allCategories [
^ (self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #'as yet unclassified' }
RBBlog >> allVisibleBlogPosts [
^ posts select: [ :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
RBBlog >> allVisibleBlogPostsFromCategory: aCategory [
^ posts select: [ :p | p category = aCategory
and: [ p isVisible ] ]

]

{ #category : #initialization }
RBBlog >> initialize [
super initialize.
posts := OrderedCollection new
]

{ #category : #removing }
RBBlog >> removeAllPosts [
posts := OrderedCollection new.
self save.

]

{ #category : #accessing }
RBBlog >> size [
^ posts size
]

{ #category : #writing }
RBBlog >> writeBlogPost: aPost [
"Write the blog post in database"
self allBlogPosts add: aPost.
self save
]
