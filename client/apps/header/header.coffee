@ViewHeader = Backbone.View.extend

	template: null

	tagName: "div"
	id: "header"

	initialize: ()->

		Template.componentHeader.events = 
			"click a": (e) ->
				App.router.aReplace(e)

		@template = Meteor.render ()->

			return Template.componentHeader()

	render: ()->
		@$el.html(@template)
		return this

	