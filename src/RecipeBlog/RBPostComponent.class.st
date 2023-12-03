Class {
	#name : #RBPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'RecipeBlog-Components'
}

{ #category : #accessing }
RBPostComponent >> date [
^ post date
]

{ #category : #initialization }
RBPostComponent >> initialize [
super initialize.
post := RBPost new
]

{ #category : #accessing }
RBPostComponent >> photoPath [
^ post photoPath
]

{ #category : #accessing }
RBPostComponent >> post: aPost [
post := aPost

]

{ #category : #rendering }
RBPostComponent >> renderContentOn:  html [
    html div
        class: 'card';
        style: 'width: auto;';
        with: [
            "Image Placeholder (Replace 'your_image_url' with the actual URL of your image)"
            html div
                class: 'card-img-top';
                style: 'background: url(' , self photoPath , ') center/cover no-repeat; height: 180px;';
                yourself.

            html div
                class: 'card-body';
                with: [
                    "Card Content"
                    html heading
                        level: 3;
                        style: 'font-family: "Gottam"; font-weight: bold;';  "Add custom font and bold style"
                        with: self title.
                  
                    html paragraph
                        class: 'card-text';
                        with: self text.
               
                ].
        ].
]

{ #category : #accessing }
RBPostComponent >> text [
^ post text

]

{ #category : #accessing }
RBPostComponent >> title [
^ post title

]

{ #category : #'as yet unclassified' }
RBPostComponent >> tryConnectionWithLogin: login andPassword:
password [
(login = self blog administrator login and: [
(SHA256 hashMessage: password) = self blog administrator
password ])
ifTrue: [
self session currentAdmin: self blog administrator.
self goToAdministrationView ]
ifFalse: [ self loginErrorOccurred ]
]
