suite "aa", ->
  test "can't create when not logged in", (done, server, client) ->
    console.log "here"
    ret = client.evalSync(->
      emit "return", "foo"
    )
    console.log ret
    done()