_.extend ReactiveAce, 
	ReactiveAce.addProperty 'insertValue', ()->
	    return @_editor?.getValue()
	  , (value) ->
	    @_editor?.setValue(value)

@configEditor = ()->
	window.editor = new ReactiveAce
	editor.attach "aceEditor"
	editor.parseEnabled = true
	editor.theme = "twilight"
	editor.syntaxMode = "html"
	aceHeight = $(window).height() - 170
	$('#aceEditor').css({height: aceHeight})
	$('div.meta').css({height: aceHeight})

	$(window).resize (e)->
		winHeight = $(window).height()
		winWidth  = $(window).width()
		aceWidth  = $(".new-post-container > .col-lg-4").width()
		calcFluidWidth = winWidth - aceWidth
		aceHeight = winHeight - 170
		$(".util-nav, .post-nav, form.main").css({width: aceWidth})
		$('#aceEditor').css({height: aceHeight})
		$('div.meta').css({height: aceHeight})

	$(window).scroll ->
		top = $(window).scrollTop()

		if top < 56
			$(".new-post-container > .col-lg-4").css({marginTop: -top})
			scrollAceHeight = ($(window).height() - 170) + top
			$("#aceEditor").css({height: scrollAceHeight})
		else if top > 56
			$(".new-post-container > .col-lg-4").css({marginTop: -56})
			$("#aceEditor").css({height: $(window).height() - 115 })

@setTutorialValues = (tut)->
	$('#title').val tut.title
	$('#synopsisTitle').val tut.synopsisTitle
	$('#synopsis').val tut.synopsis
	$('#url').val tut.url
	$('#imageUrl').val tut.imageUrl
	$('#videoUrl').val tut.videoUrl
	editor.insertValue = tut.tutBody



