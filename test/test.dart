import 'bootstrap/future.dart';


void main() {

}

class Response<T>{
  final dynamic data;

  Response(this.data);

  T getData(){
    return data;
  }
}