Class {
	#name : #SSWMySQLStatement,
	#superclass : #MySQLDriverStatement,
	#traits : 'SSWReStoreDBStatement',
	#classTraits : 'SSWReStoreDBStatement classTrait',
	#category : #'SSW ReStore MySQL'
}

{ #category : #accessing }
SSWMySQLStatement >> execute [

	^super execute ifNotNil: [ :resultSet | resultSet asSSWMySQLResultSet ]
]

{ #category : #accessing }
SSWMySQLStatement >> parent [

	^driver
]

{ #category : #accessing }
SSWMySQLStatement >> valueAt: anIndex put: anObject [
	(params at: anIndex) bindValue: anObject reStoreValue
]

{ #category : #accessing }
SSWMySQLStatement >> values [
	^ params ifNil: [ #()] ifNotNil: [ params collect: [ :each | each value ] ]
]

{ #category : #accessing }
SSWMySQLStatement >> values: aCollection [

	params := OrderedCollection new: aCollection size.
	aCollection do: [ :each | self addBinding: each reStoreValue ]
]
