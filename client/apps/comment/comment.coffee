Template.addComment.rendered = ()->
	$ ->
		el = document.createElement("script")
		el.src = "/disqus.js"
		el.type = "text/javascript"
		$("#my-disqus").prepend el