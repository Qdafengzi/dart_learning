/**
 * 正则
 */
import 'dart:io';

main(List<String> args) {
  String str = "1A 2B 11Q 12J #004488";
  //r字符串不会解析转义
  RegExp reg = new RegExp(r"((\d)+)([A-Z])");
  Iterable<Match> matches = reg.allMatches(str);
  for (Match item in matches) {
    for (int i = 0; i < item.groupCount + 1; i++) {
      String match = item.group(i);
      print("Group[$i]:$match");
    }
    print("\n");
  }

  getChiness();

  getText();
}

void getText() async {
  new HttpClient()
      .getUrl(Uri.parse("https://m.qidian.com/book/1013418682/432524332"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.transform(new SystemEncoding().decoder).listen((requestText) {
      //此时已经请求到HTML格式网页数据
      //print(requestText);

      //不区分大小写，匹配在<div class="con_top">标签中的标题
      //因为匹配的的数据中有需要转义的""双引号，所以字符串没有用"r"修饰符
      //提取的是书名，定位唯一位置，因此没有使用allMatches函数
      Match match =
          new RegExp('booktitle\\s+=\\s+"(.*)".*readtitle\\s+=\\s+ "\\s+(.*)"')
              .firstMatch(requestText);

      if (match != null) {
        //分组1为书名，分组2为章节名
        print("书名：${match.group(1)}\n章节：${match.group(2)}");
      } else {
        print("failed");
      }
    });
  });
}

void getChiness() {
  String str = "Dart中文社区";
  RegExp reg = new RegExp(r"[\u4e00-\u9fa5]+");
  Iterable<Match> matches = reg.allMatches(str);

  for (Match m in matches) {
    print(m.group(0));
  }
}
