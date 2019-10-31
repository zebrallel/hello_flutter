void abstractTest(){

}

class Dump extends FooFoo  with Vehicle, Ball implements Foo {
  @override
  String name;

  @override
  int getSize() {
    // TODO: implement getSize
    return null;
  }

  @override
  String getName() {
    // TODO: implement getName
    return null;
  }

  @override
  void fly() {
    // TODO: implement fly
  }

}

abstract class Foo{
  String name = 'foo';

  int getSize();

  String getName(){
    return name;
  }
}

mixin Vehicle{
  void run(){
    print('i can run');
  }
}

mixin Flyer{
  void fly(){
    print('i can fly');
  }
}

class FooFoo{

}

mixin Ball on FooFoo{
  void roll(){
    print('i can roll');
  }
}