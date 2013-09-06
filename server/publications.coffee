Meteor.publish "publicTutorials", ->
	Tutorials.find
		live: true
	,
		sort:
			submitted: -1
			
Meteor.publish "allTutorials", ->
	user = Meteor.users.findOne @userId
	if Roles.userIsInRole(user, ["admin"])
		Tutorials.find()
	



