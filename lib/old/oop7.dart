import 'dart:math' as math;

abstract class Shape {
  // double area(){
  //   return 10; // impl
  // }
  double area(); // override  abstract method
  // double mo7e6(); // abstract method
  void printHello() {
    // non abstract method
    print("hello");
  }
}
class Rectangle extends Shape {
  double height;
  double width;

  Rectangle({required this.height, required this.width});

  @override
  double area() {
    return 2 * height + 2 * width;
  }
}

class Square extends Shape {
  double size;

  Square({required this.size});

  @override
  double area() {
    return math.pow(size, 2).toDouble();
  }

  @override
  void printHello() {
    // optional override
    print("Hello Square");
  }
}

class Circle implements Shape {
  @override
  double area() {
    return 20;
  }

  @override
  void printHello() {
    print("Hello Circle");
  }
}

void main() {
  Rectangle rectangle = Rectangle(height: 50, width: 25);
  print(rectangle.area()); // area
  Square square = Square(size: 40);
  print(square.area());
  Circle circle = Circle();
  circle.printHello(); // Hello Circle
  square.printHello(); // Hello
}
