import 'dart:async';

void futureTest() async {
  for (var i in counter(5)) {
    print(i);
  }
  // 0 1 2 3 4
  await for(var i in counterAsync(5)){
    print(i);
  }
  // 0 1 2 3 4
}

Future delay(int seconds) {
  return Future.delayed(Duration(seconds: seconds));
}

Iterable<int> counter(int end) sync* {
  int i = 0;
  while (i < end) {
    yield i++;
  }
}

Stream<int> counterAsync(int end) async*{
  int i = 0;
  while (i < end) {
     await  delay(1);
     yield i++;
  }
}

// Future readFile() async {
//   var config = File('../config.txt');
//   Stream<List<int>> inputStream = config.openRead();

//   var lines = inputStream.transform(utf8.decoder).transform(LineSplitter());

//   try {
//     await for (var line in lines) {
//       print(line);
//     }
//     print('file closed');
//   } catch (e) {
//     print(e);
//   }
// }
