<<<<<<< HEAD
Stripe = StripeAPI "sk_test_ZbELjdnV9pbOGIQA1wcqYTuA"

#Payment method
Meteor.methods
  createCharge: (productId,pledge,token,remember) ->
    #XXX: In the near future, be sure to add server side validation
    #for the information passed here. Super important.
    #this.unblock()
    log "createCharge method called on the server!"
    userId = this.userId

    log "productId: ",productId
    log "pledge: ",pledge
    log "token: ",token
    log "remember: ",remember
    log "userId: ",userId

    user = Meteor.users.findOne(userId)

    email = user.emails
    log "email: ",email

    address = email[0].address if email?
    log "address: ",address

    customerId = user.profile.stripeCustomerId
    log "customerId: ",customerId

    #XXX: This could potentially be used to ensure that the value provided from
    #the stripeCustomerId user collection exists with Stripe. Worth looking into.
    stripeExists = Stripe.customers.retrieve(customerId) if customerId?
    log "stripeExists: ",JSON.stringify(stripeExists)

    #For saving customerId's to the user collection
    saveCustomerId =
      Meteor.bindEnvironment(
        (customerId) ->
          Meteor.users.update
            _id: userId
          ,
            $set:
              "profile.stripeCustomerId":customerId
          ,
          (err,result) ->
            if err
              log "err: ",err
            else
              log "result: ",result
      ,
        (err) ->
          log "err: ",err
      )

    if remember is "true"
      log "Remember the card!"
      if !customerId
        log "No stripe customer exists. Creating one."
        Stripe.customers.create(
          card: token
          email: address if address?
          description: userId
        ).then((customer) ->
          Stripe.charges.create
            amount: pledge
            currency: "cad"
            customer: customer.id
            description: "Pledge from userId #{userId} for ideaId #{productId}"
        ).then((charge) ->
          log "Saving customerId to user collection"
          customer = charge.customer
          saveCustomerId(customer)
        )
      else
        log "Customer already exists. charge customer."
        Stripe.charges.create
          amount: pledge
          currency: "cad"
          customer: customerId
    else
      log "Charge only once!"

      if !customerId
        log "No stripe customer exists, and remember is not set to true. Charging card one off."
        Stripe.charges.create
          amount: pledge
          currency: "cad"
          card: token
          description: "Pledge from userId #{userId} for ideaId #{productId}"
        , (err, charge) ->
          if err
            log "err: ",err
            #XXX: Add more verbose feedback and details here
          else
            log "Charge successfully went through!"
            log "charge: ",charge
      else
        log "Stripe customer exists, and remember is set to false or not defined. Charge customer."
        log "token: ",token
        log "customerId: ",customerId
        Stripe.charges.create
          amount: pledge
          currency: "cad"
          customer: customerId
          description: "Pledge from userId #{userId} for ideaId #{productId}"
=======
#Payment System - Server Side
Payments.register Stripe,
  secretKey: 'sk_07VLSkglJ9Kb3iJj3gLllaTDj7vlO'
>>>>>>> master
