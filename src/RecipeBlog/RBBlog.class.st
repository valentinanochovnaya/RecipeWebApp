"
RBBlog
"
Class {
	#name : #RBBlog,
	#superclass : #Object,
	#instVars : [
		'adminUser',
		'posts'
	],
	#category : #'RecipeBlog-Model'
}

{ #category : #'as yet unclassified' }
RBBlog class >> createDemoPosts [
"RBBlog createDemoPosts"
self current
writeBlogPost: ((RBPost title: 'Cheesy Summer Squash Flatbreads' text:
'Ingredients
3 small yellow summer squash, sliced 1/4 inch thick
1 tablespoon olive oil
1/2 teaspoon salt
2 cups fresh baby spinach, coarsely chopped
2 naan flatbreads
1/3 cup roasted red pepper hummus
1 carton (8 ounces) fresh mozzarella cheese pearls
Pepper Preheat oven to 425°. Toss squash with oil and salt; spread evenly in a 15x10x1-in. baking pan. Roast until tender, 8-10 minutes. Transfer to a bowl; stir in spinach.
Place naan on a baking sheet; spread with hummus. Top with squash mixture and cheese. Bake on a lower oven rack just until cheese is melted, 4-6 minutes. Sprinkle with pepper.' category:
'Breakfast' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/exps165395_SD163617B02_04_6b-1.jpg?fit=700%2C1024') visible: true);
writeBlogPost: ((RBPost title: 'Basil-Butter Steaks with Roasted Potatoes' text:
'Ingredients
1 package (15 ounces) frozen Parmesan and roasted garlic red potato wedges
4 beef tenderloin steaks (1-1/4 inches thick and 6 ounces each)
1/2 teaspoon salt
1/2 teaspoon pepper
5 tablespoons butter, divided
2 cups grape tomatoes
1 tablespoon minced fresh basil

Bake potato wedges according to package directions.
Meanwhile, sprinkle steaks with salt and pepper. In a 10-in. cast-iron or other ovenproof skillet, brown steaks in 2 tablespoons butter. Add tomatoes to skillet. Bake, uncovered, at 425° until meat reaches desired doneness, 15-20 minutes (for medium-rare, a thermometer should read 135°; medium, 140°; medium-well, 145°).
In a small bowl, combine basil and remaining butter. Spoon over steaks and serve with potatoes.'
category: 'Meat' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Basil-Butter-Steaks-with-Roasted-Potatoes_EXPS_CISMZ19_119908_E01_03_4b-11.jpg?fit=700%2C1024') visible: true);
writeBlogPost: ((RBPost title: 'Four-Berry Spinach Salad' text: '1 tablespoon canola oil
1 tablespoon orange juice
1 tablespoon red wine vinegar
1 tablespoon balsamic vinegar
1 tablespoon water
2 teaspoons lemon juice
1/2 teaspoon sugar
1/2 teaspoon poppy seeds
1/8 teaspoon ground allspice
Dash ground cinnamon
4 cups fresh baby spinach
1/2 cup each fresh raspberries, blueberries, blackberries and sliced strawberries
2 teaspoons chopped walnuts, toasted

In a small bowl, whisk the first 10 ingredients until blended. In a medium bowl, combine spinach and berries. Drizzle with dressing and sprinkle with walnuts; toss to coat.'
category: 'Salad' photoPath: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Four-Berry-Spinach-Salad_EXPS_SCM2BZ20_25841_E01_22_2b-10.jpg?fit=700%2C1024') visible: true)

]

{ #category : #accessing }
RBBlog class >> current [
^ self selectAll
ifNotEmpty: [ :x | x anyOne ]
ifEmpty: [ self new save ]
]

{ #category : #'as yet unclassified' }
RBBlog class >> defaultAdminLogin [
^ 'mimicry'

]

{ #category : #'as yet unclassified' }
RBBlog class >> defaultAdminPassword [
^ 'password'

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
RBBlog >> administrator [
^ adminUser
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

{ #category : #'as yet unclassified' }
RBBlog >> createAdministrator [
^ RBAdministrator
login: self class defaultAdminLogin
password: self class defaultAdminPassword
]

{ #category : #initialization }
RBBlog >> initialize [
super initialize.
posts := OrderedCollection new.
adminUser := self createAdministrator

]

{ #category : #removing }
RBBlog >> removeAllPosts [
posts := OrderedCollection new.
self save.

]

{ #category : #removing }
RBBlog >> removeBlogPost: aPost [
posts remove: aPost ifAbsent: [ ].
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
