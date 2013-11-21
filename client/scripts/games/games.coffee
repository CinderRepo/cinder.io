class @GamesController extends RouteController
  template: "games"

  waitOn: Subscriptions["games"]

  data: ->
    games: Games.find()