main(List<String> arguments) {
  // Do something
  var jenny = new Person("Jenny", "US");
  print(jenny);
}

abstract class Animal {
  void breath();

  void makeNoise() {
    print("Grrr");
  }
}

class Person implements Animal {
  String name, nationality;

  Person(this.name, this.nationality);

  @override
  void breath() {
    print("A Person is breathing");
  }

  @override
  void makeNoise() {
    print("Person shouting");
  }

  @override
  String toString() => "$name $nationality";
}

class Comedian extends Person implements IsFunny {
  Comedian(String name, String nationality) : super(name, nationality);

  @override
  void makePeopleLaugh() {
    print("Comedian make people laugh");
  }
}

abstract class IsFunny {
  void makePeopleLaugh();
}
