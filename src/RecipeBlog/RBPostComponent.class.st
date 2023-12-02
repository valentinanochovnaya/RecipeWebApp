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
                        level: 5;
                        with: self title.
                    html heading
                        level: 6;
                        class: 'card-subtitle mb-1 text-muted';
                        with: 'Subtitle'.
                    html paragraph
                        class: 'card-text';
                        with: self text.
                    html anchor
                        class: 'btn btn-success';
                        url: '#';
                style: 'margin-bottom:10px';
                        with: 'See the recipe'.
                ].
        ].
]

{ #category : #rendering }
RBPostComponent >> renderExampleOn: html [
    html card
        style: 'width: 18rem;';
        with: [ 
            "Replace 'your_image_url' with the actual URL of your image"
            html image
                url: self photoPath;
                altText: 'Image Alt Text';
                yourself.

            html cardBody: [ 
                html cardTitle level5 with: 'Title'.
                html cardSubtitle 
                    level6; 
                    mutedText;
                    with: 'Subtitle'.
                html cardText: 'Some quick example text to build on the card title and make up the bulk of the card''s content.'.
                html formButton bePrimary with: 'Go somewhere'.
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
