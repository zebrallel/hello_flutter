class Test {
  String name = 'test';
  int age = 20;

  dynamic get(params){
    print('-----');
    print(params);
    return 123;
  }
}

void main(){
  Test test = Test();
  print(test.name);
}

