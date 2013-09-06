@updateTut = ( id, prop, val )->
	
	if prop == "title"
		Tutorials.update _id: id,
			$set: 
				title: val

	if prop == "synopsisTitle"
		Tutorials.update _id: id,
			$set: 
				synopsisTitle: val

	if prop == "synopsis"
		Tutorials.update _id: id,
			$set: 
				synopsis: val
	
	if prop == "url"
		Tutorials.update _id: id,
			$set: 
				url: val

	if prop == "imageUrl"
		Tutorials.update _id: id,
			$set: 
				imageUrl: val

	if prop == "videoUrl"
		Tutorials.update _id: id,
			$set: 
				videoUrl: val

	if prop == "videoLength"
			Tutorials.update _id: id,
				$set: 
					videoLength: val



