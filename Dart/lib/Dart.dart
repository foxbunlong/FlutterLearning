import 'package:Dart/Util.dart'; // Not need to add 'as name' to refer to other class

int calculate() {
  return 6 * 7;
}

String getName() {
  return "AAAAA " + addNumber(20, 30).toString();
}

class Dog {
  String typeName;

  Dog(this.typeName);
}
