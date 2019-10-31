import 'package:flutter/cupertino.dart';

import 'bootstrap/constAndFinal.dart';
import 'bootstrap/future.dart';
import 'bootstrap/varAndDynamic.dart';

void main() {
  // varAndDynamicTest();
  // constAndFinalTest();
  // futureTest();
  // var classMirror = reflectClass();
}

class Store{
  final String name;

  const Store(this.name);
}

@Store('Peter')
class Boy{
}
