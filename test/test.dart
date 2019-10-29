void main() {
  // constAndFinalTest();
  // varAndDynamicTest();
}

void constAndFinalTest() {
  /// 1. 编译时必须确定，任何runtime时得到的值无法获取
  const a = [
    123,
    'hello',
    [
      234,
      // DateTime.now() // const修饰的对象内部所有的子对象都必须是const的
    ],
  ];

  // a.add(1); // 无法动态添加值

  /// 2. const可以用来修饰构造函数，表示该类产出的实例是const的
  Apple b = Apple('red');
  // b.color = 'blue'; // 无法更改

  /// 3. const创建的对象是复用的
  print([1,2,3] == [1,2,3]); // false
  print(const [1,2,3] == const [1,2,3]); // true
}

class Apple {
  final String color;

  const Apple(this.color);
}

void varAndDynamicTest(){
  dynamic a = '123';

  // a.foo(); // runtime error ,实际上a没有foo方法，但dynamic类型实际上通知了编译器关闭了编译时的类型检查

  a = 100; // 不会报错

  var b = 10;
  // b = '10'; // error, b的类型已经确定为int，无法赋予String类型的值
}