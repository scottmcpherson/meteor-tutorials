Template.disqus.rendered = ()->
	if !window.DISQUS
		$ ->
			el = document.createElement("script")
			el.src = "/disqus.js"
			el.type = "text/javascript"
			$("#my-disqus").prepend el
			
	DISQUS?.reset(
		reload: true
		config: ->
	)