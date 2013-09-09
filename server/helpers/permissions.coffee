@isAdmin = (userId, doc)->
	user = Meteor.user()
	if Roles.userIsInRole(user, ["admin"])
		true
	else
		false