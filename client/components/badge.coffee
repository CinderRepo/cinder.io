#Template.badge.badgeClass = () ->
	#BadgeClasses.findOne({class:'topics'}).class

#Template.badge.helpers({
#	badgeClasses: () ->
#		BadgeClasses.find({})
#	badgeState: () ->
#		'test'
#})

#Template.badge.created = () ->
#	log 'BADGE CREATED'

#Template.badge.preserve = [
#	'.badge'
#]