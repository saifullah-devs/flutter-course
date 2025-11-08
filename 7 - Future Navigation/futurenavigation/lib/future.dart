void main() {
  meraDairShnaiwalaKaam();
}

meraDairShnaiwalaKaam() {
  asyncTask();
  // ignore: avoid_print
  print("Hello world");
}

asyncTask() async {
  /*
// Catch block
futureObj.catchError((e) {
    print(e);
})

// Try Block
.then((value) => print(value));
*/

  var futureObj = Future.delayed(
    Duration(seconds: 2),
    () => "Hello World From future after 2 sec",
  );

  try {
    var responseFromFutureTask = await futureObj;
    // ignore: avoid_print
    print(responseFromFutureTask);
  } catch (e) {
    // ignore: avoid_print
    print("Error $e");
  }
}
