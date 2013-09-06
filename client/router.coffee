@Router = Backbone.Router.extend

	routes:
		"": "home"
		"tutorials/:title": "tutorial"
		"admin": "adminList"
		"admin/:id/edit": "editTutorial"
		"admin/add": "addTutorial"
		"*path": "home"

	view: null

	page_parent_sel: "#content"

	page_header_sel: "#header"

	isAdmin: false

	initialize: ()->

		@viewHeader = new ViewHeader()
		$(@page_header_sel).replaceWith(@viewHeader.render().$el)
		@isAdmin = Roles.userIsInRole(Meteor.user(), ["admin"])

	home: () ->
		@.go Home

	tutorial: (title)->
		@.go Tutorial, false, title

	adminList: ()->
		@.go AdminList, true

	editTutorial: (id)->
		@.go AdminEdit, true, id		

	addTutorial: ()->
		@.go AdminEdit, true

	go: (viewClass, adminPage, params) ->
		if !viewClass?
			viewClass = Home
		that = @
		Deps.autorun () ->
			if adminPage and !Meteor.userId()?
				role = Roles.userIsInRole(Meteor.user(), ["admin"])
				if !role
					that.aReplace(false, "/")
					 
		if !adminPage or Meteor.userId()?
					
			@view = new viewClass(params)
			@render()

	render: ()->
		$(@page_parent_sel).html(@view.render().$el)

	aReplace: (e, defaultRoute)->
		if defaultRoute?	
			@navigate("/", {trigger: true})
			window.scrollTo(0,0)
		else
			e.preventDefault()

			a = document.createElement("a")

			a.href = @getHref(e.target)
			route = a.pathname + a.search
			@navigate(route, {trigger: true})

			window.scrollTo(0,0)

	getHref: (elt)->
		if elt.hasAttribute("href")
			return elt.href 
		else 
			return @getHref(elt.parentElement)