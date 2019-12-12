import 'bootstrap/future.dart';

void main() {
  String a;

  if (a == null) {
    print('a is empty');
  }else{
    print('a is not empty');
  }

  a = '123';

  assert(a == null);
}
