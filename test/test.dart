void main() {
  final List<int> a = [];
  a.add(100);
  print(a.join(','));
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
