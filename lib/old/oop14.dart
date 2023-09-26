void main() {
  // List<String> names = ["anas", "sami"];
  Data<String> data = Data("anas"); // new object
  data.printValue();
  Data<bool> data2 = Data(false);
  data2.printValue();
  Data<double> data3 = Data(10.5);
  print(data3);
  Data<List<String>> data4 = Data(["anas", "sami"]);
  data4.printValue();
  data4.getValue();
  List<String> names = ['as'];
  Data<Map<String,int>> data5=Data({});
}

class Data<T> {
  T value;

  Data(this.value);

  void printValue() {
    print(value.toString());
  }

  T getValue() {
    return value;
  }
}
