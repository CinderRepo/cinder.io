#Conveniently output to the log without having to type console.log
@log = (log,options) ->
  if options
    console.log log,options
  else
    log = console.log log