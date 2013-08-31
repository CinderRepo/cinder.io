if typeof Handlebars isnt undefined
	Handlebars.registerHelper 'getSession', (key) ->
		Session.get key
	Handlebars.registerHelper 'sessionEquals', (key, value) ->
		Session.equals key, value
	Handlebars.registerHelper 'sessionNotEquals', (key, value) ->
		if !Session.equals key, value then true else false
	Handlebars.registerHelper 'not', (key, value) ->
		if !key or !value then true else false
	Handlebars.registerHelper 'viewing', (key) ->
		if Session.get('activeTile')
			Games.findOne(Session.get('activeTile'))
		else
			undefined