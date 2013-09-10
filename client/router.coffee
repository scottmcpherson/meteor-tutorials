@Router = Backbone.Router.extend

	routes:
		"": "home"
		"tutorials/:href": "tutorial"
		"admin": "adminList"
		"admin/:id/edit": "editTutorial"
		"admin/add": "addTutorial"
		"*path": "home"

	view: null

	page_parent_sel: "#content"

	page_header_sel: "#header"

	initialize: ()->
		@viewHeader = new ViewHeader()
		$(@page_header_sel).replaceWith(@viewHeader.render().$el)


		@bind 'route', @_trackPageview

	home: () ->
		@.go Home

	tutorial: (href)->
		@.go Tutorial, false, href

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
			if route is "/"
				Session.set "title", undefined
			@navigate(route, {trigger: true})

			window.scrollTo(0,0)

	getHref: (elt)->
		if elt.hasAttribute("href")
			return elt.href 
		else 
			return @getHref(elt.parentElement)

	_trackPageview: ->
		url = Backbone.history.getFragment()
    
		#prepend slash
		url = "/" + url  if not /^\//.test(url) and url isnt ""
		_gaq.push ["_trackPageview", url]