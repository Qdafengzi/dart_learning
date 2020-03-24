void main() {
  print('Wang' ' ' 'Jianfei');
  print('Wang' ' ' 'Jianfei');
  var name = 'Wang' ' ' 'Jianfei';
  assert(name == "Wang Jianfei");
  print("断言通过");
  print("我的名字是：$name");
  var hex = 0xDEADBEEF;
  print("整型转换为16进制：$hex —> 0x${hex.toRadixString(16).toUpperCase()}");
  print("现在支持+" + "连接");

  assert(sayHello is Function, "错误");

  // assert(name is Function,"错了");
  print('111');
  assert(sayHello is sayHe);
  print('222');
  // assert(sayHello is sayHe01, "错误错误");
  print('1333');

  var x = makeSubstract(5);
  print(x);
  print(x(2));

var callbacks = [];
for (var i = 0; i < 3; i++) {
  // 在列表 callbacks 中添加一个函数对象，这个函数会记住 for 循环中当前 i 的值。
  callbacks.add(() => print('Save $i')); 
}
callbacks.forEach((c) => c()); // 分别输出 0 1 2

}

//闭包函数
Function makeSubstract(num n) {
  return (num i) => n - i;
}

typedef String sayHe(String name);
String sayHello(String name) {
  return 'Hello $name';
}

typedef String sayHe01(int name);
String sayHello01(String name) {
  return 'Hello $name';
}
