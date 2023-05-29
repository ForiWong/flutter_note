// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

void main() {
  //变量声明
  //var 关键字
  var t = "hi world";
  //t = 1000; //类型一旦确定后则不能更改其类型。

  //dynamic Object 声明的变量都可以赋值任意对象，且后期可以改变赋值的类型
  dynamic d;
  Object x;
  d = 1000;
  x = 1000;
  d = "hi world";
  x = "Hello Flutter";
  //Object声明的对象只能使用Object的属性与方法，否则编译器会报错
  print(d.lenght);
  //print(x.lenght);//The getter 'lenght' isn't defined for the type 'Object'.

  //final const
  final str = "hi world";
  const str1 = "hi world";

  //空安全（null-safety）
  int i = 8; //默认为不可空，必须在定义时初始化。
  int? j; // 定义为可空类型，对于可空变量，我们在使用前必须判空。

  // 如果我们预期变量不能为空，但在定义时不能确定其初始值，则可以加上late关键字，
  // 表示会稍后初始化，但是在正式使用它之前必须得保证初始化过了，否则会报错
  late int k;
  k = 9;
}

int? i;
Function? fun;

say() {
  if (i != null) {
    print(i! * 8); //因为已经判过空，所以能走到这 i 必不为null，如果没有显式申明，则 IDE 会报错
  }
  if (fun != null) {
    fun!(); // 同上
  }
  fun?.call(); // fun 不为空时则会被调用
}
