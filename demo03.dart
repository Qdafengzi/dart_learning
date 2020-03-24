/**
 * 操作符和流程控制语句
 */
main(List<String> args) {
  int a = 3;
  int b = 2;
  //取整
  print(a ~/ b);

//  级联操作符
  Person p = new Person();
  p
    ..name = 'Qdafengzi'
    ..setCountry('CHina');
  print(p);

//对错
  bool isRight = false;
  print(isRight);

//循环
  var collection = [1, 2, 3, 4];
  collection.forEach((x) => print(x));
  print('------');
  for (var item in collection) {
    print(item);
  }

  //switch
  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      print('CLOSED');
      continue nowClosed; // 继续执行被 nowClosed 标记的 case
    case 'OPEN':
      print('OPEN');
      break;
    nowClosed:
    case 'NOW_CLOSED':
      print('NOW_CLOSED');
      break;
  }

  //和Java一样
  try {} catch (e) {}
}

class Person {
  String name;
  String country;
  void setCountry(String country) {
    this.country = country;
  }

  String toString() => 'Name:$name \nCountry:$country';
}
