/**
 * 对象和类
 */
main(List<String> args) {
  // var p1= new Point(1, 2, 3);
  // var p2 = new Point.formeList([1, 2, 6, 4]);
  var p2 = new Point.formeInt("1", "3", "4");

  // print(p1);
  print(p2);

  Student student = new Student('Tom');
  print(student.name);
  print(student.nickName);

  student.name = "Tony";
  print(student.name);
  print(student.nickName);

  student.nickName = "马化腾";
  print(student.name);
  print(student.nickName);

  MyPrinter myPrinter = new MyPrinter();
  myPrinter.printMethod("这就是爱情");

  MyMyPrinter myMyPrinter = new MyMyPrinter();
  myMyPrinter.printMethod("今天是情人节");

  var logger = new Logger('UI');
  logger.log('Button clicked');
}

class Student {
  String name;
  Student(this.name);
  String get nickName => "绰号:" + name;
  set nickName(String nickName) => name = "绰号:" + nickName;
}

class Point {
  num x, y, z;
  Point(this.x, this.y, z) {
    this.z = z;
  }

  Point.formeList(var list)
      : x = list[0],
        y = list[1],
        z = list[2] {}

  Point.formeInt(var x, var y, var z)
      : x = num.parse(x),
        y = num.parse(y),
        z = num.parse(z) {}

  String toString() => 'x:$x y:$y z:$z';
}

//不可变的构造函数
class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y); // 常量构造函数
  static final ImmutablePoint origin =
      const ImmutablePoint(0, 0); // 创建一个常量对象不能用new，要用const
}

//抽象类
abstract class Printer {
  printMethod(String content);
}

class MyPrinter implements Printer {
  @override
  printMethod(String content) {
    print('MyPrinter打印机---' + content);
    return null;
  }
}

class MyMyPrinter extends MyPrinter {
  // MyMyPrinter() : super();
  @override
  printMethod(String content) {
    print('MyMyPrinter打印机---' + content);
    return null;
  }
}

abstract class Shape {
  // 定义了一个 Shape 类/接口
  num perimeter(); // 这是一个抽象方法，不需要abstract关键字，是隐式接口的一部分。
}

class Rectangle implements Shape {
  // Rectangle 实现了 Shape 接口
  final num height, width;
  Rectangle(num this.height, num this.width); // 紧凑的构造函数语法
  num perimeter() => 2 * height + 2 * width; // 实现了 Shape 接口要求的 perimeter 方法
}

class Square extends Rectangle {
  // Square 继承 Rectangle
  Square(num size) : super(size, size); // 调用超类的构造函数
}

class Logger {
  final String name;
  bool mute = false;

  // 变量前加下划线表示私有属性
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}
