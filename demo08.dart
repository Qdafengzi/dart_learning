/**
 * 文件和文件夹
 */

import 'dart:io';
import 'dart:async';
import 'dart:convert';

main(List<String> args) {
  fun1();
  fun2();
  fun3();

  // fun4();
  // handleDir();
  // handleFile();
  // handleLinkFile();
  copyFileByStream();
}
/**
 * 复制文件
 */
void copyFileByStream() async {
  File file = new File("金瓶梅.txt");
  if (await file.exists()) {
    print("sourcePath:${file.path}");
  }
  Stream<List<int>> inputStream = file.openRead();
  StreamSubscription subscription = inputStream.listen(null);
  File targetFile = new File('我爱编程.txt');
  IOSink sink = targetFile.openWrite();
  // await file.copy(targetFile.path);
  // await sink.addStream(inputStream);
  int fileLength = await file.length();
  int count = 0;
  String progress = "*";
  subscription.onData((list) {
    count = count + list.length;
    double num = (count * 100) / fileLength;
    DateTime time = new DateTime.now();
    print(
        "[${time.hour}:${time.second}:${time.millisecond}]${progress * (num ~/ 2)}");
    sink.add(list);
  });
  subscription.onDone(() {
    print("over");
    sink.close();
  });
}

/**
 * 链接不能指向文件，链接不能剪切移动
 * 链接可以作为普通文件操作
 */
void handleLinkFile() async {
  var file = await new Directory('linkDir').create();
  var link = await new Link('shortcut').create("linkDir");
  print(link.path);
  print(await link.target());

  link = await link.rename('link');
  print(link.path);
}

void handleFile() async {
  File file = new File('default.ini');
  if (!await file.exists()) {
    file = await file.create();
  }
  print(file);

  file = await file.writeAsString('[General]\nCode=UTF8');
  file = await file.writeAsString('Hello dart\n 嘿嘿');
//  以字符串的形式写入
  print("\nRead String:\n${await file.readAsString()}");
  print("\nRead Lines");
  List<String> lines = await file.readAsLines();
  lines.forEach((String line) => print(line));
//以字节的形式写入
  file = await file.writeAsBytes(utf8.encode("编码= UTF8"));
  print("\n Read Bytes:");
  print(utf8.decode(await file.readAsBytes()));
}

void handleDir() async {
  //recursive递归  Platform.pathSeparator==/
  var dir = await new Directory('dir${Platform.pathSeparator}one')
      .create(recursive: true);
  assert(await dir.exists() == true);
  print("path:${dir.absolute.path}");

  dir = await dir.rename('dir/subdir');
  print("path:${dir.absolute.path}");

  //创建临时文件夹
  var temDir = await Directory.systemTemp.createTemp('temDir');
  assert(await temDir.exists() == true);
  print("temDir:${temDir.path}");
  //返回上一级
  var parentDir = temDir.parent;
  print("parent Dir: ${parentDir.path}");
  //列出所有的文件 不包括链接和子文件夹
  //文件 、目录、链接都是继承FileSystemEntity  有三个常量：Directory FILE LINK NOT_FOUND
  Stream<FileSystemEntity> entityList =
      parentDir.list(recursive: false, followLinks: false);
  await for (FileSystemEntity item in entityList) {
    print(item.path);
  }

  //删除临时文件夹
  await temDir.delete();
  assert(await temDir.exists() == false);
}

void fun4() {
  final filePath = r"/back.txt";

  try {
    File file = new File(filePath);
    file.writeAsString("$file");
  } catch (e) {
    print(e);
  }
}

void fun1() {
  var dir = new Directory('temp1');
  dir.createSync();
  print(dir.absolute.path);
}

void fun2() {
  new Directory('temp2').create().then((dir) => print(dir.absolute.path));
}

fun3() async {
  var dir = await new Directory("temp3").create();
  print(dir.absolute.path);
}
