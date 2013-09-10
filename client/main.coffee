@App = {}
Meteor.subscribe "others"

Meteor.subscribe 'publicTutorials'
Meteor.subscribe 'allTutorials'

Session.setDefault "title", undefined
	
Meteor.startup ->
	Deps.autorun () ->
		title = Session.get("title")
		document.title = (if title then title + " | Meteor Tutorials" else "Meteor Tutorials | Learn Meteor js")
	$ ->
		App.router = new Router()
		Backbone.history.start({pushState: true})

