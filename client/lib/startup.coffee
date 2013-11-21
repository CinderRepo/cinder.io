#Deps.autorun(->
  #Make sure there is always an automatic user logged in.
  #if !Meteor.user()
  #  Meteor.loginAnonymously()
#)