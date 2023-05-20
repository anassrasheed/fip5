void main() {
  printName("Anas");
// printName("Sami");
  printName2();
  printName2(name: "Sami");
  printName3(); // null
  printName3(name: "Sameer");
  printName4(name: "", age: 10);
  printName5();
  printName5("Norhan");
  printName6("ahmad");
  printName6("ahmad", age: 10);
  printName6("ahmad", age: 10, ssn: "9959555");
  printName6("ahmad", ssn: "9959555");
  /*Person person=Person(name: "asd", age: 10, weight: 55, height: 54, ssn: "asd");
  person.name="Saaed";
  person.age;*/
  // person._mobileNumber;
/*  Employee employee=Employee("Hasan", 21, 600);
  print(employee.getName()); // hasan
  print(employee.age);
  print(employee.getAge());

  print(employee.name);*/ // hasan  getter
  // employee.name="Ahmad"; // setter

  /*employee.height=200;
  employee.height=1500;
  print(employee.height);
  employee.salary=3000;
  print(employee.salary);
  print(employee.height);*/
  // print(employee.getName());
  // print(employee.getAge());
  // print(employee.getSalary());
  // print(employee.name);
  // employee.setName("Saaeed"); // method
  // print(employee.name);
  // employee.name="Anas";
  // print(employee.name);
  // employee.name="Saaed";
}

void printName(String name) {
  print("Your name is $name");
}

void printName2({String name = 'StepByStep'}) {
  // optional named parameter
  print("Your name is $name");
}

void printName3({String? name}) {
  // nullable
  print("Your name is $name");
}

void printName4({required String name, required int age}) {
  // optional named parameter
  print("Your name is $name");
}

printName5([String? name]) {
  //optional  parameter
  print("Your name is $name");
}

printName6(String name, {int age = 0, String? ssn}) {
  // function
  print("Your name is $name");
}
