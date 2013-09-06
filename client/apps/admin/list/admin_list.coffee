@AdminList = Backbone.View.extend

	template: null

	initialize: ()->
		Template.adminList.events = 
			"click a": (e)->
				App.router.aReplace(e)
				
		@template = Meteor.render ()->
			html = Template.adminList({adminTutorials: Tutorials.find()})
			return html

	render: ()->
		@$el.html(@template)
		return this