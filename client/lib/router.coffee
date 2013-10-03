Router.configure
  layout: "layout"
  notFoundTemplate: "notFound"
  loadingTemplate: "loading"

  renderTemplates:
    "header":
      to: "header"
    "leftSidebar":
      to: "leftSidebar"
    "rightSidebar":
      to: "rightSidebar"

@Subscriptions =
  content: Meteor.subscribe "allContent"
  users: Meteor.subscribe "allUsers"