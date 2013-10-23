Router.configure
  layoutTemplate: "layout"
  notFoundTemplate: "notFound"
  loadingTemplate: "loading"
@Subscriptions =
  content: Meteor.subscribe "allContent"
  about: Meteor.subscribe "allAbout"
  community: Meteor.subscribe "allCommunity"
  rewards: Meteor.subscribe "allRewards"
  commissions: Meteor.subscribe "allCommissions"
  updates: Meteor.subscribe "allUpdates"
  users: Meteor.subscribe "allUsers"
  posts: Meteor.subscribe "allPosts"