@nonEmptyString = Match.Where((x) ->
  check x, String
  x.length isnt 0
)