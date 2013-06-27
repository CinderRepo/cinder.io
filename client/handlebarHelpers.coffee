if typeof Handlebars isnt undefined
	Handlebars.registerHelper 'getSession', (key) ->
		Session.get key
	Handlebars.registerHelper 'sessionEquals', (key, value) ->
		Session.equals key, value