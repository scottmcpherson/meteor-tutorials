if Tutorials.find().count() == 0
	# now = new Date().getTime()
	# synop = "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida..."
	
	userOneRole = ["admin"]

	userOne = Accounts.createUser
		name: "Scott"
		email: "scotty.fl27@gmail.com"
		password: "Franco28!"
		roles: userOneRole
		profile:
			name: "Scott"
			layout: "list"

	Meteor.users.update _id: userOne,
		$set: 
			'emails.0.verified': true

	Roles.addUsersToRoles userOne, userOneRole

	scott = Meteor.users.findOne _id: userOne
	
	# Tutorials.insert
	# 	title:'A test object post.'
	# 	url:'test-obj-title'
	# 	imageUrl: 'alfred.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 10
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h1>Test for the object insert</h1>'
	# 	live: true
	# 	submitted: now - 1 * 3600 * 1000

	# Tutorials.insert 
	# 	title:'Alfred Plus Meteor.'
	# 	url:'test-title-one'
	# 	imageUrl: 'stylus.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 8
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h1>Test for the h1</h1>'
	# 	live: true
	# 	submitted: now - 2 * 3600 * 1000
		
	# Tutorials.insert 
	# 	title:'Insuring Data Integrity.'
	# 	url: 'test-title-two'
	# 	imageUrl: 'check.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 12
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h2>Secrets of a JavaScript Ninja</h2>'
	# 	live: true
	# 	submitted: now - 3 * 3600 * 1000
		
	# Tutorials.insert
	# 	title:'Reactive Bootstrap Modals.'
	# 	url: 'tets-title-three'
	# 	imageUrl: 'modal.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 11
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h3>JavaScript: The Good Parts</h3>'
	# 	live: true
	# 	submitted: now - 4 * 3600 * 1000

	# Tutorials.insert 
	# 	title:'Supercharge with Stylus'
	# 	url:'test-title-four'
	# 	imageUrl: 'stylus.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 18
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h1>Test for the h1</h1>'
	# 	live: true
	# 	submitted: now - 5 * 3600 * 1000

	# Tutorials.insert 
	# 	title:'Insuring Data Integrity.'
	# 	url: 'test-title-five'
	# 	imageUrl: 'check.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 22
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h2>Secrets of a JavaScript Ninja</h2>'
	# 	live: true
	# 	submitted: now - 6 * 3600 * 1000
		
	# Tutorials.insert
	# 	title:'Reactive Dialog Modals.'
	# 	url: 'tets-title-six'
	# 	imageUrl: 'modal.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 3
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h3>JavaScript: The Good Parts</h3>'
	# 	live: true
	# 	submitted: now - 7 * 3600 * 1000

	# Tutorials.insert 
	# 	title:'Supercharge with Stylus'
	# 	url:'test-title-seven'
	# 	imageUrl: 'stylus.jpg'
	# 	videoUrl: '//www.youtube.com/embed/vpp-8gkPWVE'
	# 	videoLength: 2
	# 	synopsisTitle: "Placeholder"
	# 	synopsis: synop
	# 	tutBody: '<h1>Test for the h1</h1>'
	# 	live: true
	# 	submitted: now - 8 * 3600 * 1000
		
	

	# console.log 'Creating Users: '
	# users = [
	# 	{name: "Mike", email: "mike.fl27@gmail.com", roles:[]}
	# ]
	# _.each users, (userData)->
	# 	console.log userData

	# 	id = Accounts.createUser
	# 		email: userData.email
	# 		password: "rascal"
	# 		profile:
	# 			name: userData.name

	# 	Meteor.users.update _id: id,
	# 		$set: 
	# 			'emails.0.verified': true

	# 	Roles.addUsersToRoles id, userData.roles







		