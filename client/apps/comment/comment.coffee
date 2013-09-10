Template.disqus.rendered = ()->
	console.log "from comment", @
	$ ->
		el = document.createElement("script")
		el.src = "/disqus.js"
		el.type = "text/javascript"
		$("#my-disqus").prepend el