import 'package:Dart/Dart.dart' as Dart;
import 'package:Dart/Util.dart' as util;

main(List<String> arguments) {
  var country = 'Vietnam';

  String name;
  name = 'Long';
  String lastName = 'Thay';

  int age = 30;
  num number = 1.1; // double

  bool isTrue = true;

  const pi = 3.14;
  final pi2 = 3.14;
//  pi = 200.00;

  print(isTrue);
  print("${name.toUpperCase()} is $age years old"); // concatenation
  print(8 % 3); // remainder
  print(name is! int); // is not

  doSomething();
  print(sayHello(name, lastName));

//  var mic = new Microphone();
//  mic.name = "My Microphone";
//  mic.color = "Red";
//  mic.model = 3;

  var mic = new Microphone("My Microphone", "Red", 3);
  print(mic.name);
  mic.turnOn();

  var mic2 = new Microphone.init();
  print(mic2.name);

  var mic3 = new Microphone("My Microphone", "Red", 3);
  mic3.setName = "New name micro";
  print(mic3.getName);

  // Libs
  print("Hello ${Dart.getName()}");
  print(new Dart.Dog("Huggy").typeName);

  print(util.addNumber(20, 30));
}

void doSomething() {
  // or doSomething()
  print(showName());
  print(getAge());
}

String showName() {
  return getName();
}

String getName() => "Long Thay";
int getAge() => 30;

String sayHello(String name, String lastName, [int age]) => "Hello $name $lastName, $age years old.";

class Microphone {
  String name;
  String color;
  int model;

  // Explicit Constructor - Syntactic Sugar Constructor
  Microphone(this.name, this.color, this.model);

  // Named Constructor
  Microphone.init() {
    name = "Default Microphone";
    model = 123;
  }

  // Explicit Constructor - Another way
//  Microphone(String name, String color, int model) {
//    this.name = name;
//    this.color = color;
//    this.model = model;
//  }

  String get getName => name;
  set setName(String value) => name = value;

  void turnOn() {
    print("$name is on!");
  }

  void turnOff() {
    print("$name is off!");
  }
}