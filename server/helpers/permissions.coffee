@isAdmin = (userId, doc)->
	user = Meteor.user()
	if Roles.userIsInRole(user, ["admin"])
		console.log "allowed!!!"
		true
	else
		console.error "denied!!!"
		false