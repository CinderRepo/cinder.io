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
  games: Meteor.subscribe "allGames"
  movies: Meteor.subscribe "allMovies"
  shows: Meteor.subscribe "allShows"
  users: Meteor.subscribe "allUsers"