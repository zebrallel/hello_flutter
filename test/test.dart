void main() {
  var child = new Child();
  child.hello();
  print(child == 4);

  const list = [1,2,3,4,5];
  int sum = list.reduce((value, ele) => value + ele);
  print(sum);
  var pairs = [[1, 2], [3, 4]];
  print(pairs.expand((pair) => pair).runtimeType);
}

abstract class Parent{
  Parent();

  void hello(){
    print("this is parent");
  }

  void say();
}

class Child extends Parent{
  Child();

  @override
  void hello(){
    super.hello();

    print("this is child");
  }

  @override
  bool operator ==(dynamic num){
    return num > 10;
  }

  @override
  void say() {
    // TODO: implement say
  }
}

