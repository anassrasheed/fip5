void main() {
  // new object
  Person anas = Person(
      name: "Anas Rasheed",
      age: 20,
      weight: 80,
      height: 170,
      ssn: "999995959595"); // new object
  print(anas.name);
  print(anas.age);
  print(anas.weight);
  print(anas.height);
  print(anas.ssn);
  print(anas.toString());
  anas.printName();
  print("My Birthdate in year is " + anas.yearOfBirth().toString());
  anas.age = 21;
  anas.height = 172;
  anas.weight = 90;
  print(anas.age);
  print(anas.weight);
  print(anas.height);
  // anas._mobileNumber='';
  // Shape rectangle = Shape();
  // print(rectangle.x); //10
  // rectangle.x=25;
  // print(rectangle.x); // 25
  // Shape triangle=Shape(); // 10
  // print(rectangle.x); // 25
  // print(triangle.x); // 10
  // Person? sami; // decleration // memory X
  // sami =
  //     Person(name: "Sami", age: 33, weight: 80, height: 150, ssn: "156165165");
  // print(sami!.yearOfBirth());
  // Shape shape = Shape();
  // shape.printHala();
  // print(null.yearOfBirth());
  Employee employee = Employee("Hasan", 25, 600); // new instance object
  print(employee._name);
  print(employee._age);
  print(employee._salary);
  Shape rectangle = Shape();
}

// class Object // attributes
// Name Age Weight Height Ssn
class Person {
  // upper camel case
  // data type
  // object
  String name; // omar
  int age; // omar
  double weight; // 1
  double height; // 50
  String ssn; // 84984
  String _mobileNumber = ''; // lower camel case
  // access modeifiers public private
  // encapsulation
  Person(
      {required this.name,
      required this.age,
      required this.weight,
      required this.height,
      required this.ssn}); // constructor method

  void printName() {
    print("Your name is $name");
  }

  int yearOfBirth() {
    //lower camel case
    return 2023 - age;
  }
// method
}

// class Shape {
//   // int x = 10;
//   void printHala() {
//     print("Hala bekom erhebo");
//   }
// }
class Employee {
  String _name;
  double _age;
  double _salary;
  double? height;

  Employee(this._name, this._age,
      this._salary) {} // Constructor Default values Method

  // String getName() {
  //   return _name;
  // }
  String getName() {
    return _name;
  }

  String get name => _name;

  double getAge() => _age;

  double get age => _age;

  set salary(double value) {
    // 300 3000
    if (_age < 23 && value > 700) {
      _salary = 700;
    } else {
      _salary = value;
    }
  }

  double get salary => _salary;

// String getName() => _name; // arrow lambda  method
//
// double getAge() => _age;
//
// double getSalary() => _salary;
//
// String get name => _name; // getter
//
// double get salary => _salary;
//
// set name(String value) {
//   _name = value;
// }
//
// void setName(String value){
//   _name=value;
// }
}

class Shape {}
