@Tutorial = Backbone.View.extend 

	template: null

	initialize: (href)->
		Template.showTutorial.events = 
			"click a": (a)->
				App.router.aReplace(e)
		

		@template = Meteor.render (data) ->
			# Session.set "title", data.title	
			data = Tutorials.findOne({url: href})	
			html = Template.showTutorial({tutorial: data})
			return html
			

	render: ()->
		@$el.html(@template)
		return this

Template.showTutorial.rendered = ->
	Prism.highlightAll()