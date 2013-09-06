@Tutorial = Backbone.View.extend 

	template: null

	initialize: (title)->
		Template.showTutorial.events = 
			"click a": (a)->
				App.router.aReplace(e)

		@template = Meteor.render () ->
			html = Template.showTutorial({tutorial: Tutorials.findOne({url: title})})
			return html
			

	render: ()->
		@$el.html(@template)
		return this