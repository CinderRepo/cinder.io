suite('aa', function() {
  test("can't create when not logged in", function(done, server, client) {
    console.log('here');

    var ret = client.evalSync(function() {
      emit('return', 'foo');
    });
    console.log(ret);
    done();
  });
});