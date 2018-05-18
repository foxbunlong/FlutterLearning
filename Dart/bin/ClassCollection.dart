/**
 * Lists and Maps
 * Lists = ArrayList
 * Maps = HashMap
 */

main(List<String> arguments) {
  var student = new Student();
  student.name = "Long";
  student.level = "Level 3";
  student.showName();
  student.showLevel();
  student.sayHello();

  // Inherited constructor
  var elevated = new ElevatedLocation(2000.0, 2000.0, 90);

  print(elevated); // this will call toString()

  // Lists
  var list = [1, 2, 3, 5, 7, 9, 11];
  print(list.length);
  print(list[3]);

  var stringList = new List<String>();
  stringList.add("AAAA");
  stringList.add("BBBB");
  stringList.add("CCCC");
  stringList.add("DDDD");

  for (int i = 0; i < stringList.length; i++) {
    print(stringList[i]);
  }

  var james = new Person();
  james.name = "James";
  var marry = new Person();
  marry.name = "Marry";

  var personList = new List<Person>();
  personList.add(james);
  personList.add(marry);

  // Maps
  var winners = {"first": "Bill", "second": "Long", "third": "Bond"};
  print(winners["second"]);

  winners.forEach((k, v) => print(k));

  var keys = winners.keys;
  print(keys);
  var values = winners.values;
  print(values);
}

class Person {
  String name, lastName, nationality;
  int age;

  void showName() {
    print(this.name);
  }

  void sayHello() {
    print("Hello");
  }
}

class Student extends Person {
  String level;

  void showLevel() => print(level);

  @override
  void sayHello() {
    print("Good morning");
  }
}

class Location {
  num lat, lng;

  Location(this.lat, this.lng);
}

class ElevatedLocation extends Location {
  num elevation;

  // Inheritance for constructor
  ElevatedLocation(num lat, num lng, this.elevation) : super(lat, lng);

  @override
  String toString() {
    var result = "Location is $lat $lng $elevation";
    return result;
  }
}
