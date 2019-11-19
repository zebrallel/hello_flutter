void abstractTest(){

}

class Dump extends FooFoo with Vehicle, Ball implements Foo {}

// 使用extends实现继承
class FooFoo{}

// implements抽象类，必须重写类中的所有方法
abstract class Foo{}

// 使用with，可直接使用mixin内的方法，变量
mixin Vehicle{}
mixin Flyer{}

// 给mixin添加了限定，必须继承自FooFoo类的class，才可以使用本mixin
mixin Ball on FooFoo{
}