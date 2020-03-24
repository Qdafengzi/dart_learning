/**
 * 容器
 */

main(List<String> args) {
  StringBuffer sb = new StringBuffer("---");
  sb.write('aaa');
  sb.write('bbb');
  print(sb.toString());
  sb.clear();
  print(sb.toString());
  print('--------');

  var fruits = ['bananas', 'apples', 'oranges'];

  fruits.forEach((item) => print(item));
  print('-----');
  fruits.sort((a, b) => a.compareTo(b));
  fruits.forEach((item) => print(item));

  //Set集合在Dart中无序，并且每个元素具有唯一性
  /**
   * Map
  迭代器中有一个有意思的函数any，用来检测迭代器中的数据
  当其中一个元素运行函数时return true，那么any的返回值就为true，否则为false
  与之相对的是函数every，要所有函数运行函数return true，那么every返回true

  V putIfAbsent(K key, Function V ifAbsent())函数，通过Key来查找Value
  当某个Key不存在的时候，会执行第二参数的Function来添加Value
   */
  

}
