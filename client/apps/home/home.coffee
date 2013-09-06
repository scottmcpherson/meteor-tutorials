@Home = Backbone.View.extend 

	template: null

	initialize: ()->
		Template.home.events = 
			"click a": (e)->
				App.router.aReplace(e)

		@template = Meteor.render ()->
			html = Template.home({tutorials: Tutorials.find()})
			return html

	render: ()->
		@$el.html(@template)
		return this