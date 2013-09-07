@App = {}
Meteor.subscribe "others"

Meteor.subscribe 'publicTutorials'
Meteor.subscribe 'allTutorials'
	
Meteor.startup ->
	$ ->
		App.router = new Router()
		Backbone.history.start({pushState: true})
		console.log "awesome added"
