# Meteor.users.allow 
# 	update: (userId, doc)->
# 		console.log userId
# 		console.log doc
# 		true

# Meteor.methods
# 	changeLayout: (attributes)->
# 		Meteor.users.update Meteor.userId(),
# 		$set:
# 			profile:
# 				layout: attributes