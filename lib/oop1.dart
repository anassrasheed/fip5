void main() {
  List<int> numbers = [
    100,
    25,
    64,
    7,
    -25,
    47,
    65,
    0,
    21,
    17,
    -32,
    200,
    -300,
    400,
    645,
    214
  ];
  // find the biggest number inside the list
  // assume the biggest number is the first number

  print(findMaxFromList(numbers, 20));

  List<int> temps = [25, 24, 28, 17, 10, 0, -2, 8, 15, 30];
  List<int> temps2 = [25, 24, 28, 17, 10, 0, -2, 8, 15, 30];
  List<int> temps3 = [25, 24, 28, 17, 10, 48, -2, -8, 15, 30];
  List<int> temps4 = [25, 24, 28, 17, 10, 0, -2, 31, 15, 30];
  List<int> temps5 = [25, 24, 28, 17, 10, 0, -2, 38, 15, 30];
  List<int> temps6 = [25, 24, 28, 17, 10, 0, -2, 40, 15, 30];
  List<int> temps7 = [25, 24, 28, 17, 10, 0, -2, 8, 35, 30];
  List<int> temps8 = [25, 24, 28, 17, 10, 0, -2, 8, 15, 30];
  print(findMaxFromList(temps, 10));
  print(findMaxFromList(temps2, 10));
  print(findMaxFromList(temps3, 10));
  print(findMaxFromList(temps4, 10));
  print(findMaxFromList(temps5, 10));
  print(findMaxFromList(temps6, 10));
  print(findMaxFromList(temps7, 10));
  print(findMaxFromList(temps8, 10));
  print(getPi() * 20);
  printName();
  int min = minNumOfList(data: temps); // int min = -2;
  int min2 = minNumOfList(data: temps3); // int min = -8;
  int min3 = minNumOfList(data: temps4); // int min = -8;
  print(minNumOfList(data: temps7)); // int min = -8;
  print(min * 2);
  print(min2 * 2); // -16
  print(minNumOfList(data: temps7));
  print(minNumOfList());
  printTraineeName(name: "Anas"); // shortcut ctrl + space
  printTraineeName(name: "Sami"); // shortcut ctrl + space
  printTraineeName(name: "Saeed"); // shortcut ctrl + space

  printUniversityName(uniName: "BAU");
  printUniversityName(uniName: "JU");
  printUniversityName();
}

// synatax
//  [data type output] [methodName related] (input optional) {}
int findMaxFromList(List<int> data, int c) {
  // method function
  // arguments parameters
  int max = data.first; // 100 200 400 645
  for (int index = 0; index < data.length; index++) {
    if (data[index] > max) max = data[index];
  }
  return max;
}

double getPi() {
  // no arguments no input
  // return 3.14; // output
  print("hello1");
  print("hello1");
  print("hello1");
  print("hello1");
  print("hello1");
  return 3.14;
  print("hello"); //Dead code
}

// lower camel case naming convention
void printName() {
  // no argument and no output
  print("anas");

}

int minNumOfList({List<int>? data}) {
  // mandetory -> Optional
  if (data == null) return -1; // throw exception
  int min = data.first;
  for (int index = 0; index < data.length; index++) {
    if (min > data[index]) min = data[index];
  }
  return min; //-2
}

void printTraineeName({String name = ''}) {
  // optional named
  print("Hello " + name);
}

void printUniversityName({String uniName = 'HEU'}) {
  // optional
  // named optional
  // if (uniName == null)
  //   print("you are not a student");
  // else
  print("Your university is " + uniName);
}

// arguments parameter  0 100
// arguments mandetory optional
