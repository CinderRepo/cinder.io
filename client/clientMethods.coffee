Meteor.saveGame = (file, id) ->
  fileReader = new FileReader()
  fileReader.onload = (file) ->
    Meteor.call "saveGame", file.srcElement.result, id
  fileReader["readAsBinaryString"] file