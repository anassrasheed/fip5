// basics dart
// variable
// oop
import 'dart:math' as math;

// import 'dart:math';
void main() {
  // method

  print("Hello World"); // String
  print(5);
  // syntax    print( *anything*);
  print(500); // syntax error

  // data types

  // variables
  // String
  print("anas is the flutter instructor"); // double qutation   single qutation
  print('yara');
  print('o');
  print('25');
  print('true');
  // syntax
  // [data type]  [name] = [value];
  String x = "Ahmad"; // variable  2 operations    decleration + init
  print(x); // Ahmad
  x = "Sami"; // chnage value
  print(x); // Sami
  // String name=10; // syntax error
  // int
  // [data type]  [name] = [value];
  // int number = 10; // variable name number data type int  value 10
  // print(number);
  // int max = -250;

  // double

  double average = 10.5;
  print(average);
  average = 5; // 5.0
  print(average);

  // bool
  bool isMale = true; // 1 0
  print(isMale);

  // 2 dynamic data types
  //var
  //dynamic

  var k = "hello"; // String
  k = "anas";

  dynamic kk = "hello"; //8 bit
  kk = 10;
  kk = false;
  kk = -25.15;
  kk = true; //16 byte 1 bit

  // varibale
  // rules how to name the variables

  String tomato = "Suhaib";
  // _ or letter (small)
  String user = "asd";
  // int hh;
  // avoid start with umber or special charachter
  // avoid use keywords
  // lower camel case valuable
  // String
  // void
  // ="anas";
  // String int = "asd"; // class
  // String true="anas";
  // print(int);
  //
  String studentName = "Hani"; // lower camel case
  String city = "Amman"; // lower camel case
  String ssn = "9981014445"; // lower camel case
  String girlName = "Sawsan";
  // studentIdNumber  student id number
  // studentFamilyName
  // studentFamilyNumber

  // string methods
  print("****************************************");
  String word = 'Hello World';
  print(word); // Hello World
  print(word.length);
  int length = word.length;
  print(word.isEmpty); // false
  print(word.isNotEmpty); // true
  bool isWordNotEmpty = word.isNotEmpty;
  print(isWordNotEmpty);
  print(word.toUpperCase()); // HELLO WORLD
  word = word.toUpperCase(); // assign
  print(word); // HELLO WORLD
  print(word); // HELLO WORLD
  print(word); // HELLO WORLD
  print(word); // HELLO WORLD
  print(word); // HELLO WORLD

  print(word.toLowerCase()); // hello world
  print(word); // HELLO WORLD

  print(word.contains("WOR")); // true
  print(word.contains("wor")); // false // case sensitive
  print(word.contains("123")); // false
  print(word.contains(" ")); // true
  print(word.contains("  ")); // false

  print(word.startsWith("W")); // false
  print(word.startsWith("HELLO")); // true
  print(word.startsWith("HE")); // true
  print(word.startsWith("hello")); // false

  print(word.endsWith("O")); // false
  print(word.endsWith("d")); // false
  print(word.endsWith("RLD")); // true
  print(word.endsWith("ORLD")); // true

  print(" Anas is the flutter instructor "
      .trim()); // remove extra spacing from start and end
  print(
      " Anas is the flutter instructor "); // remove extra spacing from start and end
  print(" Anas is the flutter instructor "
      .trimLeft()); // remove extra spacing from start and end
  print(" Anas is the flutter instructor "
      .trimRight()); // remove extra spacing from start and end

  print(
      word.indexOf("O")); // HELLO WORLD   11   Zero Base Progamming language 4
  print(
      word.indexOf("L")); // HELLO WORLD   11   Zero Base Progamming language 4
  print(word
      .indexOf("WOR")); // HELLO WORLD   11   Zero Base Progamming language 6
  print(word.indexOf(
      "WOO")); // HELLO WORLD   11   Zero Base Progamming language -1  not found
  print(word.indexOf(
      "K")); // HELLO WORLD   11   Zero Base Progamming language -1  not found

  print(word.lastIndexOf("O")); //7

  print(word[0]); // H
  print(word[8]); // R
  // print(word[25]); // R // error logical error semantic error  runtime error
  print(word[0] + word[6]); // concatenation دمج HW
  print(10 + 15); // 25
  //Hello World
  print(word.substring(6));
  print(word.substring(11));
  print(word.substring(1));
  print(word.substring(0, 8)); // end index not included

  print(word.replaceAll("O", "OO")); //Hella warld
  print(word.replaceFirst("O", "OO")); //Hella warld
  print(word.replaceRange(6, 8, "AA")); //
  print(word.replaceRange(1, 6, "Anas")); // HAnasWORLD   HAnasOAD
  print(word.replaceRange(1, 6, "anas").replaceRange(6, 8, "Anas")); //
  // String result=word.replaceRange(1, 6, "Anas")+word.replaceRange(6, 8, "Anas");
  // print(result);

  // print(word.substring(12));
  // print(word.substring(20));
  // declare 5 variables
  // 3 String  1 int 1 bool
  // int bool change value twice  print
  //3 string length isEmpty isNotEmpty toUpperCase toLowerCase contains  startsWith endsWith  indexOf lastIndexOf  word[0]
  // concatenate the three variables in one variable and print it .
  // String sentence=word+word2+word3;
  // print(sentence);
  // A B C       72   73    a 105    b 106
  print(word.compareTo('hello world'));
  print('a'.compareTo('a')); // 0  ASCI CODE
  print('a'.compareTo('b')); // -1
  print('b'.compareTo('a')); // 1   problem solving

  //stack abcdegkjhoiwcje
  //sorting
  // () ^ */  +-   left to right ltr
  print(10 * 10);
  print(5 * 10 - 3);
  print(5 - 3 * 10); //-25
  print((5 - 3) * 2 + (4 * 8)); // 2 * 2 + (4*8)  2*2+32 = 36
  print(10 / (5 * 5 + 5 * 5 + 4) * 4); // 10 / (25 + 5*5 +4) *4   10 /54*4
  print(10 ^ 2); //  math its not a power
  print(math.pow(10, 2)); // 100
  print(math.min(10, 20)); // 10
  print(math.max(10, 20)); // 20
  print(math.sqrt(49)); // 7
  print(math.sin(90)); // 7
  print(math.cos(90)); // 7

  print(5 > 3); //true
  print(10 < 10); // false
  print(10 != 10); // false
  print(10 == 10); // true
  print(5 >= 5); // true
  print(5 <= 5); // true
  print(6 <= 5); // false
  print(3 == 3); // true

  print((5 * 3) > (10 / 5 * 2 + 4)); // 15 > 8 true

  int avg = 20;
  print(avg.isEven); // true
  print(avg.isOdd); // false
  print(avg.isNegative); // false
  print(!avg.isNegative); // true
  double val = 22.1; //22 23
  print(val.toInt()); // 22
  print(val.floor()); // 22
  print(val.round()); // 23
  print(val.ceil()); // 23
  print(val.abs());
  print((-22).abs()); // -22  22
  // double number=15.50
  // print(number.floor()); // 15
  // print(number.ceil()); // 16
  // print(number.round()); // 15
  // print(number.round()); // 16
  // decleration + init

  String sami = "sami"; //decleration + init
  // decleration
  String? husain; // decleration  memory null nullable
  print(husain); // null
  // print(husain!.length); // null
  husain = "Husain"; // init memory
  print(husain);

  // syntax error   logical error / runtime error
  // null safety

  String sawsan = "sawsan"; // decleration + init
  print(sawsan);
  print(sawsan.length);

  String? reem; // decleration null  nullable variable
  reem = 'reem';
  print(reem.length);
  reem = null; // removed from memory

  // oop
  // non null safe
  // null safety

  // collections
  // List Arraylist  Stack Queue Map

  int number = 10; // number = 10
  print(number);

  // List marks = [10, 20, 30, 10, 20, 50, 60, -10, 82, 156, 651, 98, 15, 65, 35]; // data types
  // print(marks);
  // List data = [10, "sdfgdsf", true, 15.22, 'a']; // data types
  // print(data);

  // generic type
  List<int> marks = [10, 20, 40, 22, 54, 8, 89, 98, 20, 489];
  List<String> names = ["Anas", "husain", "rawan", "nawal", "ahmad"];
  List list = [false, 22, "anas"];
  List<bool> c = [true, false, true, false, false, false, true];

  print(marks.length); // 9
  print(marks.isEmpty); // false
  print(marks.isNotEmpty); // true
  print(marks.first); // 10
  print(marks.last); // 489
  print(marks.contains(8)); // true
  print(marks.contains(-254)); // false
  print(marks[1]); // 20
  print(marks[marks.length - 1]); // 20 marks[8] 489
  print(marks[0]); // 10
  print(marks.indexOf(8)); // 5
  print(marks.indexOf(-100)); //  -1
  // print(marks[100]); // error
  print(marks.lastIndexOf(20)); // 8
  print(marks.indexOf(20)); // 1
  print("******************************");
  print(marks);
  print(marks.toSet());
  print(marks);
  marks = marks.toSet().toList();
  print(marks);
  print(marks.firstWhere(
      (element) => element.isEven)); // first filter element 10 20 30
  print(marks.lastWhere((element) => element.isOdd)); // last  10 20 30
  marks.add(111);
  print(marks);
  marks.insert(0, 222);
  print(marks);
  marks.addAll([10, 20, 30]);
  marks.addAll([55, -500, 3654]);
  print(marks);
  marks = marks.reversed.toList();
  print(marks);
  List<int> marks2 = [10, 20, 10, 20];
  marks.addAll(marks2);
  print(marks);
  List<int> oddMarks =
      marks.where((element) => element.isOdd).toList(); // where ui
  print(oddMarks);
  marks.remove(-500);
  print(marks);
  marks.remove(10); // first filter
  print(marks);
  marks.removeWhere((element) => element > 50);
  print(marks);
  marks.removeWhere((element) => element == 10);
  print(marks);
  marks.removeAt(3);
  print(marks);
  marks.removeLast();
  print(marks);
  marks.removeRange(0, 2); // not included
  print(marks); // [40 , 20 , 20]   [8 , 40, 20, 20]
  marks.add(-1);
  print(marks);
  print(marks.any((element) => element.isNegative)); //at least on element match
  print(marks.every((element) => element > -2)); // true
  marks.add(-3);
  print(marks);
  print(
      marks.every((element) => element > -2)); // false // all elements matches
  marks.sort(); // 1 - 10
  marks = marks.reversed.toList(); // 10 -1
  print(marks);
  print(marks.firstWhere((element) => element.isEven));
  print(marks.skip(1).firstWhere((element) => element.isEven));

  // List<String> names  15
  //print(marks.length); // 9
  //   print(marks.isEmpty); // false
  //   print(marks.isNotEmpty); // true
  //   print(marks.first); // 10
  //   print(marks.last); // 489
  //   print(marks.contains(8)); // true
  //   print(marks.contains(-254)); // false
  //   print(marks[1]); // 20
  //   print(marks[marks.length - 1]); // 20 marks[8] 489
  //   print(marks[0]); // 10
  //   print(marks.indexOf(8)); // 5
  //   print(marks.indexOf(-100)); //  -1
  //   // print(marks[100]); // error
  //   print(marks.lastIndexOf(20)); // 8
  //   print(marks.indexOf(20)); // 1

  // List data [String , int , bool ]    10
  //print(marks.length); // 9
  //   print(marks.isEmpty); // false
  //   print(marks.isNotEmpty); // true
  //   print(marks.first); // 10
  //   print(marks.last); // 489
  //   print(marks.contains(8)); // true
  //   print(marks.contains(-254)); // false
  //   print(marks[1]); // 20
  //   print(marks[marks.length - 1]); // 20 marks[8] 489
  //   print(marks[0]); // 10
  //   print(marks.indexOf(8)); // 5
  //   print(marks.indexOf(-100)); //  -1
  //   // print(marks[100]); // error
  //   print(marks.lastIndexOf(20)); // 8
  //   print(marks.indexOf(20)); // 1

  // functions list
  // Map

  // if condition
  // if (condition) {  }
  if (5 > 3) {
    print("Hello FIP5");
  }

  if (5 > 5) {
    print("NO");
  }

  if (10 > 100) {
    print("sami");
  } else {
    print("Wrong  Result");
  }

  int numberOfBirds = 9;

  if (numberOfBirds > 20) {
    print("birds are more than 20");
  } else {
    if (numberOfBirds > 15) {
      print("birds are more than 15");
    } else {
      if (numberOfBirds > 10) {
        print("birds are more than 10");
      } else {
        print("birds less than 10");
      }
    }
  } // nested if else

  if (numberOfBirds > 20) {
    print("birds are more than 20");
  } else if (numberOfBirds > 15) {
    print("birds are more than 15");
  } else if (numberOfBirds > 10) {
    print("birds are more than 10");
  } else {
    print("birds less than 10");
  }

  // switch

  // syntax   switch(value)  {
  //  case value : {} break;
  //
  // }
  print("switch ***************************");
  switch (numberOfBirds) {
    case 9:
      print("birds is 9");
      print("birds is less than 10 ");
      print("birds is Anas ");
      break;
    case 11:
      print("birds are 11");
      break;
    case 12:
      print("birds are 12");
      break;
    case 13:
      print("birds are 13");
      break;
    case 14:
      print("birds are 14");
      break;
    case 15:
      print("birds are 15");
      break;
    default:
      print("birds are another number");
  }
  print("switch ended");

  // for loop
  print(1);
  print(2);
  print(3);
  print(4);
  print(5);
  print(6);
  print(7);
  print(8);
  print(9);
  print(10);

  // for loop
  // syntax for(start counter; condition; inc/dec){
  //
  // }
  int index = 0;
  print(index);
  index++; // index = index+1;
  print(index);
  index--; // index = index -1 ;
  print(index);
  index += 5; // index = index +5;
  index -= 2; // index=index-2;
  index = index + 9; // index+=9;
  index *= 2; // index = index *2;
  // index/=2; //
  print(index); // 24 23 24
  print(index + index-- + index + ++index);
  // 24 + 24 + 23 + 24 = 95
  index = 10;
  print(index++); // print(10); index=index+1;
  print(index); // 11
  index = 10;
  print(++index); // 11 //index=index+1;  print(10);
  print(index); // 11

  for (int counter = 1; counter <= 10; ++counter) {
    print(counter); // 1 2 3 4 5 6 7 8 9
  }
  // print(counter);

  index = 1;
  for (; index <= 10; index++) {
    print(index); // 1 2 3 4 5 6 7 8 9 10
  }

  index = 1;
  for (; index <= 10;) {
    print(index); //1 2 3 4 5 6 7 8 9 10
    index++; // 2 3
  }
  print(index); // 11

  for (int counter = 0; counter < 20; counter += 2) {
    print(counter); // 0 - 19  even  0 2 4 6 8 10 12 14 16 18
  }
  for (int counter = 1; counter < 100; counter *= 2) {
    print(counter);
  }

  for (int counter = 10; counter > 0; counter--) {
    print(counter); // 10 9 8 7 6 5 4 3 2 1
  }

  for (int counter = 10; counter < 9; counter++) {
    print("anas"); //
  }

  // for (int counter = 1; counter > 0; counter++) {
  //   print(counter); // 1 2 3 4 5 6 7 8 9
  // }

  for (int counter = 1; counter <= 10; counter++) {
    if (counter == 5 || counter == 7) {
      continue; // skip for
    }
    print(counter); // 1 2 3 4 6 7 8 9 10
  }

  for (int counter = 1; counter < 10; counter++) {
    if (counter / 3 == 1) {
      break; // end loop  for switch
    }
    print(counter); // 1 2
  }

  //infinity loop  stackoverflow  memory leak

  // while do while
  // map
  // method
  // class
  // oop

  // List<String> 20 names
  // اطبع الأسماء التي عدد أحرفها زوجي
  // اطبع الأسماء التي عدد أحرفها فردي
  // اطيع الأسماء التي عدد أحرفها أكبر من 5
  // اطيع الأسماء التي تنتهي بحرف ال a
  // اطيع الأسماء التي تبدأ بحرف ال n
  // اطيع ان كان هنالك كلمات عدد أحرفها 5 true , false
  // اطيع ان كانت كل الكلمات عدد أحرفها أكثر من أو يساوي 3
  // احدذ الكلمات التي عدد حروفها 5
  // احذف الكلمات التي عدد حروفها زوجي
  // احذف جميع الأسماء المتكررة

  // print all numbers from 1 to 100 expect full 10 20 30 40 50 60 70 80 90 100
  // print all numbers between 60 - 20 -3  example 60 - 57 - 54 ....   -3
  // print all numbers between 10-25 except 16 and 22 and 24

  print("*************TASK******************");
  List<String> classNames = [
    "Anas",
    "Ali",
    "Taasneem",
    "Ahmad",
    "Ibrahim",
    "Sara",
    "Nawal",
    "Nora",
    "Omar",
    "Zara",
    "Fatima",
    "Sawsan",
    "Rania",
    "Anas",
    "Laila",
    "Kareem",
    "Samia",
    "Malik",
    "Iman",
    "Aisha"
  ];

  print(
      classNames.where((element) => element.length.isEven).toList()); // 1000000

  print(
      classNames.where((element) => element.length.isOdd).toList()); // 1000000
  // for
  print(classNames.where((element) => element.length > 5).toList());

  print(classNames.where((element) => element.endsWith("a")).toList());
  print(classNames
      .where((element) => element.toLowerCase().startsWith("n"))
      .toList()); // nawal  n
  bool isFound = classNames.any((element) => element.length == 5);
  // true
  if (isFound) {
    print("Exist");
  } else {
    print("Not Exist");
  }

  print(isFound ? "Exist" : "Not Exist");
  print(
      classNames.any((element) => element.length == 5) ? "Exist" : "Not Exist");
  // print(isFound==true ? "Exist" : "Not Exist"); // short condition
  print(classNames.where((element) => element.length == 5).toList().isNotEmpty
      ? "Exist"
      : "Not Exist");

  List<String> wordsLength5 =
      classNames.where((element) => element.length == 5).toList();
  print(wordsLength5.isNotEmpty ? "Exist" : "Not Exist");

  // [Anas, Taasneem, Sara, Nora, Omar, Zara, Fatima, Sawsan, Anas, Kareem, Iman] 0-19
  print("*******************for**************");
  bool isWordFound = false;
  for (int index = 0; index < classNames.length; index++) {
    if (classNames[index].length == 5) {
      isWordFound = true;
      break;
    }
  }
  print(isWordFound ? "Exist" : "Not Exist");
  // print("Not Exist");

  print(classNames.every((element) => element.length >= 3)
      ? "All Names more than 2 chars"
      : "Not All Names more than 2 chars");

  bool isMoreThan2 = classNames.every((element) => element.length >= 3);
  if (isMoreThan2 == true) {
    print("All Names more than 2 chars");
  } else {
    print("Not All Names more than 2 chars");
  }

  print(classNames);
  classNames.removeWhere((element) => element.length == 5);
  print(classNames);

  classNames = classNames.toSet().toList();
  print(classNames);

  int num = 0;
  for (; num < 10;) {
    print(num); // infinite loop
    num++;
  }
  num = 20;
  while (num < 10) {
    print(num); // infinite loop
    num++;
  } // 0
  num = 0;
  do {
    print(num);
    print("doWhile");
    num++;
  } while (num < 10);

  // list  map  collections

  // list<int> numbers = [1,2,3,4,5,6];  print(numbers[1]);
  // Map <>   // key value  Anas Rasheed  200    Sami Ahmad  400   Laila Sameer 600
  // Map<String,int> map={}; // unique
  Map<String, int> map = {
    "Anas Rasheed": 500,
    "Sami Ahmad": 400,
    "Laila Sameer": 600
  }; // declare init Dectionary json
  print(map.length);

  print(map["Anas Rasheed"]); // 200
  map.putIfAbsent("Anas Rasheed", () => 300); // ignore
  map.putIfAbsent(
      "Ahmad Awad", () => 300); // ignore // map .ifAbsent list.add()
  print(map["Anas Rasheed"]); // 200
  print(map["Ahmad Awad"]); // 600
  print(map["Batata"]); // null  function crash
  map["Anas Rasheed"] = 800;
  map["Sawsan Rami"] =
      700; // if key not found will add it , else will update it
  map.putIfAbsent("Sawsan Rami", () => 600); // ignore lambda
  print(map["Anas Rasheed"]); // 800
  print(map["Sawsan Rami"]); // 800

  map["Anass Rasheed"] = 200;

  print(map.isNotEmpty);
  print(map.isEmpty);
  print(map.keys.toList());
  print(map.values.toList());
  if (map.containsKey("Ali")) print(map["Ali"]);
  if (map.containsValue(800)) {
    print("the employee x has salary 800");
  }
  Map<String, int> newMap = {};
  map.forEach((key, value) {
    if (value > 400) {
      newMap.putIfAbsent(key, () => value);
    }
  });
  print(newMap);
  print(map);
  map.remove("Sawsan Rami");
  print(map);

  map.removeWhere((key, value) => value > 600);
  print(map);

  // map.clear(); // clear all map

  // map.update("Anasss Rasheed", (value) => 200); // ignore
  // map["Anasss Rasheed"]=200; // add update
  map.updateAll((key, value) => value + 100);
  print(map);

  // Task Map <String,String> data    Key employeeID "123456" : "Anas Rasheed"
  // {"1" : "Anas Rasheed", "2" : "Aseel" , "3" : "Ahmad"}
  Map<String, String> employees = {"1": "Anas", "2": "Ahmad", "3": "Aseel"};
  employees.forEach((key, value) {
    if(value.length==5)
      print(value);
  });
  // method
  // class
  // oop
}
