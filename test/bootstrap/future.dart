import 'dart:collection';

void futureTest() async {
  print('start');
  await delay(3);
  print('end');

  var foo = Foo();  

  for(int i in foo){

  }
}

Future delay(secs){
  return Future.delayed(Duration(seconds: secs));
}

class Foo extends ListBase{
  @override
  int length;

  @override
  operator [](int index) {
    // TODO: implement []
    return null;
  }

  @override
  void operator []=(int index, value) {
    // TODO: implement []=
  }

}