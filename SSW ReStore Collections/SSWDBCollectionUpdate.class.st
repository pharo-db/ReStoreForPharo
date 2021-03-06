"
ReStore
©2019 John Aspinall
https://github.com/rko281/ReStoreForDolphin
https://github.com/rko281/ReStoreForPharo
"
Class {
	#name : #SSWDBCollectionUpdate,
	#superclass : #SSWDBCollectionChange,
	#instVars : [
		'newTarget'
	],
	#category : #'SSW ReStore Collections'
}

{ #category : #'instance creation' }
SSWDBCollectionUpdate class >> entry: aCollectionEntry newTarget: anObject [

	^(self newWithEntry: aCollectionEntry)
		newTarget: anObject;
		yourself
]

{ #category : #'actions - api' }
SSWDBCollectionUpdate >> applyTo: aCollection [

	self affectedEntry target: self newTarget
]

{ #category : #testing }
SSWDBCollectionUpdate >> canRemoveValue [

	^true
]

{ #category : #'actions - api' }
SSWDBCollectionUpdate >> commitFor: aCollectionProxy [

	self affectedEntry isPersistent ifTrue: 
		[aCollectionProxy _collectionSpec 
			updateEntry: self affectedEntry 
			withTarget: self newTarget
			in: aCollectionProxy _reStore]
]

{ #category : #accessing }
SSWDBCollectionUpdate >> newTarget [

	"newTarget stores the object which is now in the position of the collection
	associated with the receiver's entry"

	^newTarget
]

{ #category : #accessing }
SSWDBCollectionUpdate >> newTarget: anObject [

	"newTarget stores the object which is now in the position of the collection
	associated with the receiver's entry"

	newTarget := anObject
]
