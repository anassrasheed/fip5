void main() {
  Weak weak = Weak([Day.saturday, Day.monday]);
  print(weak.days);
  Gender gender = Gender.male;
  Day weekEnd = Day.friday;
  if (gender == Gender.male) {
    print("this person is male");
  } else {
    print("this Person is female");
  }

  List<String>? names; // = [] = ["anas"]  no address
  // names=["Anas"]; //

  // print(names![0]);
  try {
    print(names![0]);
    String ssn = ""; // 10
    print(ssn.substring(5));
  } catch (e) {
    print(e);
    print("Something went wrong please try again later");
  }

  // null exception  ["Anas"]  crash temp close
  // handled exception

  final String name; //
  name = "Anas";
  // name="Sally";

  const String name2="Anas"; // decleration + init hotreload not applicable
  // name2="Ahmad";
  // name2="Ahmad";


  Weak weak2=Weak([]); // new object
  print(weak2.days); // []
  print(weak2.days); // []
  print(Weak.counter); // 0
  Weak.counter++; // 1
  Weak.counter++; // 2
  print(Weak.counter); // 2
  // main3();
}

class Weak {
  List<Day> days = [];
  static int counter=0; // shared   object
  Weak(this.days); // composotion
}

enum Day { saturday, sunday, monday, tuesday, wedensday, thursday, friday }

enum Gender { male, female }
