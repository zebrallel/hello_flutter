void main() {
  var f = Foo();
  f.gotoSky();
  print(f.canFly);
}

class Foo with Flyer implements C, D{
  void gotoSky(){
    print('111');
  }

  @override
  void bbb() {
    // TODO: implement bbb
  }
}

class C {

}

class D {

}

mixin Flyer {
  bool canFly = true;

  void gotoSky(){
    print('i can go to sky');
  }

  void bbb();
}
