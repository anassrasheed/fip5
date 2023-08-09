void main() {
  Person ahmad = Person(); // new object 123
  Person sami = Person(); // new object 123
  // singelton design pattern

  ahmad.name = "Ahmad";
  print(sami.name); // null Ahmad

  // print(person == person2); // false
}

class Person {
  static final Person _x = Person._private(); // new object   123

  factory Person() {
    return _x;
  }

  String? name;
  int? age;

  Person._private(); // private constructor
}
