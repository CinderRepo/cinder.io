suite "signupForm", ->
  test "Check Username", (done, server, client) ->
    console.log "Checking Username.."
    #ret = client.evalSync(->
    #  emit "return", "Clientside Username"
    #)
    #console.log ret
    done()

  test "Check Email", (done, server, client) ->
    console.log "Checking Email.."
    #ret = client.evalSync(->
    #  emit "return", "Clientside Email"
    #)
    #console.log ret
    done()

  test "Check Boop", (done, server, client) ->
    console.log "Checking Boop.."
    #ret = client.evalSync(->
    #  emit "return", "Clientside Boop"
    #)
    #console.log ret
    done()

  test "Check Yep", (done, server, client) ->
    console.log "Checking Yep.."
    #ret = client.evalSync(->
    #  emit "return", "Clientside Yep"
    #)
    #console.log ret
    done()