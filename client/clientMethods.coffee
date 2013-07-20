#Initialize Analytics
@analytics = new Tracker()
analytics.register GoogleAnalyticsTracker,
	account: 'UA-42498225-1'
analytics.register MixpanelTracker,
	account: '70a86db45c5533029c063ade1a6fc437'

#Handle Window Resizing
window.onresize = ->
	getWindowSize()

#Handle Window Closing
window.onbeforeunload = ->
	shutdownCinder()

@getWindowSize = () ->
	Session.set('windowWidth',window.innerWidth)
	Session.set('windowHeight',window.innerHeight)

@shutdownCinder = () ->
	log 'Aw :( Window is closing..deallocate some values for analytics'
	if Session.get('modalState')
		analytics.track 'User stopped viewing ' + Session.get('modalState') + ' modal'
	if Session.get('appState')
		analytics.track 'User stopped viewing ' + Session.get('appState') + ' page'
	analytics.track 'User exited or refreshed window'

#Check user's operating system
@checkOS = () ->
	Session.setDefault('currentOS','Unknown OS')
	if navigator.appVersion.indexOf('Win') isnt -1
		Session.set('currentOS','windows')
	if navigator.appVersion.indexOf('Mac') isnt -1
		Session.set('currentOS','macos')
	if navigator.appVersion.indexOf('X11') isnt -1
		Session.set('currentOS','unix')
	if navigator.appVersion.indexOf('Linux') isnt -1
		Session.set('currentOS','linux')