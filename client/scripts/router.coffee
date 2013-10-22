Router.configure
  layoutTemplate: "layout"
  notFoundTemplate: "notFound"
  loadingTemplate: "loading"
@Subscriptions =
  content: Meteor.subscribe "allContent"
  community: Meteor.subscribe "allCommunity"
  rewards: Meteor.subscribe "allRewards"
  users: Meteor.subscribe "allUsers"
  posts: Meteor.subscribe "allPosts"