void varAndDynamicTest(){
  dynamic a = '123';

  // a.foo(); // runtime error ,实际上a没有foo方法，但dynamic类型实际上通知了编译器关闭了编译时的类型检查

  a = 100; // 不会报错

  var b = 10;
  // b = '10'; // error, b的类型已经确定为int，无法赋予String类型的值
}