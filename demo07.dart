/**
 * Future和异常处理
 * 和Java的不一样，涉及到Future的时候比较复杂
 */

main(List<String> args) {
//竟然不会报错 => Infinity无穷大
  print(1 / 0);
  try {
    String a = "hha";
    print(int.parse(a));
    // throw  Exception("oh 天呢! 你居然转换错误了数据类型");
  } catch (e) {
    print(e);
  }

  /**
  * 
  我们可以通过myFunc().catchError()仅捕获计算过程中的异常，如果我们要处理计算返回的值，
  并且区分异常产生的位置，可以设置then()的onError参数

  myFunc()
  .then(successCallback, onError: (e) {
    ...
  })
  .catchError(handleError);


  myFunc()
    .then(...)
    .catchError(handleFormatException,
                test: (e) => e is FormatException)
    .catchError(handleAuthorizationException,
                test: (e) => e is AuthorizationException);

  var server = connectToServer();
server.post(myUrl, fields: {"name": "john", "profession": "juggler"})
      .then(handleResponse)
      .catchError(handleError)
      .whenComplete(server.close);

  */

  //  注意：
  //情况一：异常的处理函数必须在Future完成之前注册，避免Future出现Error并抛出异常的时候
  //，捕获异常的回调函数还没有注册成功
  Future future = myFunc();
  new Future.delayed(const Duration(milliseconds: 500), () {
    future.then((value) => print(value)).catchError((e) => print(e));
  });
}

myFunc() async {
  throw new Exception("Dart Exception");
  // return "Dart";
}
