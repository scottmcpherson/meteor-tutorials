Session.setDefault "editTutorialId", null
Session.setDefault 'fullPreviewView', true
@AdminEdit = Backbone.View.extend
	
	template: null

	initialize: (id)->

		if id		
			Session.set "editTutorialId", id
			Template.adminEdit.events = 
				"keyup input": (e)->

					tutId = Session.get "editTutorialId"
					target = $(e.currentTarget).attr('name')
					value = $(e.currentTarget).val()
					updateTut(tutId, target, value)

				"keyup textarea#synopsis": (e)->
					tutId = Session.get "editTutorialId"
					target = "synopsis"
					value = $(e.currentTarget).val()
					updateTut(tutId, target, value)


				"click .post-nav li": (e)->
					isActive = $(e.currentTarget)
					if not isActive.hasClass('active')
						$('.post-nav li').removeClass('active')
						isActive.addClass('active')
						if isActive.hasClass('post')
							console.log "show post"
							$('div.meta').addClass('hide')
							$('div.editor').removeClass('hide')
						else
							$('div.editor').addClass('hide')
							$('div.meta').removeClass('hide')

				"click .full-small button": (e)->
					targ = $(e.currentTarget)
					if not targ.hasClass('active')
						$('.full-small button').removeClass('active')
						if targ.hasClass('small-view')
							Session.set 'fullPreviewView', false
							targ.addClass('active')
						else
							Session.set 'fullPreviewView', true
							targ.addClass('active')
		
			@template = Meteor.render ()->

				html = Template.adminEdit()				
				return html

		else 
			@createTut()

	render:()->
		@$el.html(@template)
		return this


	createTut: ()->
		
		tutId = Tutorials.insert
			title: "Placeholder"
			url: "a-new-url"
			imageUrl: null
			videoUrl: null
			videoLength: 0
			synopsisTitle: "Placeholder"
			synopsis: "Placeholder"
			tutBody: "<h3>Placeholder</h3>"
			live: false
			submitted: new Date().getTime()
			
		if tutId 
			@initialize tutId
	populateFields: ()->
		tutId = Session.get "editTutorialId"
		data = Tutorials.findOne({_id: tutId})
		console.log data

	Template.previewTutorial.helpers
		editTutorial: ->
			tutId = Session.get "editTutorialId"
			tut = Tutorials.findOne({_id: tutId})
			tut
		fullPreviewView: ()->
			Session.equals 'fullPreviewView', true ? true : false


Template.aceEditor.rendered = ->
	configEditor()
	setData = ()->
		Meteor.setTimeout ( ->
			tutId = Session.get "editTutorialId"
			data  = Tutorials.findOne _id: tutId
			if data
				setTutorialValues data
			else		
				setData()
		), 100
	setData()
	editor._getSession().on 'change', (e)->
		tutBody = editor.value
		tutId = Session.get 'editTutorialId'
		Tutorials.update _id: tutId, 
			$set: 
				tutBody: editor.value

Template.previewTutorial.rendered = ->
	Prism.highlightAll()

		


