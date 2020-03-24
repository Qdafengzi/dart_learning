/**
 * 函数
 */
main(List<String> args) {
  FunX(999);
  FunX(999,b:45,c:36,d:888);
}

//可选参数
FunX(a,{b,c:3,d:4,e}){
  print('$a $b $c $d $e');
}