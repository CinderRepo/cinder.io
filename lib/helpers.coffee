#Conveniently output to the log without having to type console.log
@log = (log,options) ->
  if options
    console.log log,options
  else
    log = console.log log

#Convert a string into a this-is-a-slug type of url format.
@toSlug = (string) ->
  if string
    string.replace(/[^\w\s]/gi,"").split(" ").join("-").toLowerCase()