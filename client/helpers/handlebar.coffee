Handlebars.registerHelper 'formatDate', (date) ->
	monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
	newDate = new Date(date)
	month   = newDate.getMonth()
	monthNames[month] + " " + newDate.getDate() + " " + newDate.getFullYear()

Handlebars.registerHelper 'isAdmin', () ->
	user = Meteor.user()
	if Roles.userIsInRole(user, ["admin"]) then true else false

