
typedef bool CALLBACK();

class Test {
// Dart是一种真正的面向对象的语言，所以即使是函数也是对象，并且有一个类型Function。
// 这意味着函数可以赋值给变量或作为参数传递给其他函数，这是函数式编程的典型特征。
  final _nobleGases = [0, 1];


  bool isNoble(int atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }

//Dart函数如果没有显示声明返回值类型时，会默认当做dynamic处理。
//函数返回值没有类型推断

  isNoble2(int atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }

  void test(CALLBACK cb) {
    print(cb());

    //test(isNoble(123)); //类型不对
    test(isNoble2(123));
  }

//函数简写语法，只包含一个表达式的函数
  bool isNoble3(int atomicNumber) => true;

//函数作为变量
  var say = (str) {
    print(str);
  };

  void test2() {
    say("hi world");

    //调用execute,讲箭头函数作为参数传递
    execute(() => print("xxx"));

    say2('Bob', 'Howdy');
    say2('Bob', 'Howdy', 'smoke signal');

    enablkeFlags(bold: true, hidden: false); //使用指定命名参数

    Future.delayed(Duration(seconds: 2), (){
      return "hi world";
    }).then((data){//then
      print(data);
    });

    Future.delayed(Duration(seconds: 2),(){
      throw AssertionError("Error");
    }).then((data){
      //执行成功回会走到这里
      print("success");
    }).catchError((e){
      //执行失败会走到这里
      print(e);
    });

    Future.delayed(Duration(seconds: 2),(){
      throw AssertionError("Error");
    }).then((data){
      //执行成功回会走到这里
      print("success");
    }, onError: (e){
      print(e);
    });

    Future.delayed(Duration(seconds: 2), (){
      throw AssertionError("Error");
    }).then((data){
      print(data);
    }).catchError((e){
      print(e);
    }).whenComplete(() {
      print("123");
    });

    Future.wait({
      //2秒后返回结果
      Future.delayed(Duration(seconds:2),(){
        return "hello";
      }),
      Future.delayed(Duration(seconds:4),(){
        return "world";
      })
    }).then((results){
      print(results[0] + results[1]);
    }).catchError((e){
      print(e);
    });

  }

  login(String name, String pwd){
    return Future.delayed(Duration(seconds:2),(){
      return "hello";
    });
  }

  getUserInfo(String id){
    return Future.delayed(Duration(seconds:2),(){
      return "hello-1";
    });
  }

  saveUserInfo(String info){
    return Future.delayed(Duration(seconds:2),(){
      return "hello-2";
    });
  }

  void test3(){
    //低于回调
    login("alice","******").then((id){
      //登录成功后通过，id获取用户信息
      getUserInfo(id).then((userInfo){
        //获取用户信息后保存
        saveUserInfo(userInfo).then((){
          //保存用户信息，接下来执行其他操作
          //...
        });
      });
    });

    //使用Future消除Callback Hell
    login("alice","******").then((id){
      return getUserInfo(id);
    }).then((userInfo){
      return saveUserInfo(userInfo);
    }).then((e){
      //执行接下来的操作
    }).catchError((e){
      //错误处理
      print(e);
    });

    Stream.fromFutures([
      Future.delayed(Duration(seconds: 1),(){
        return "hello 1";
      }),
      Future.delayed(Duration(seconds: 2),(){
        throw AssertionError("Error");
      }),
      Future.delayed(Duration(seconds: 3),(){
        return "hello 3";
      }),
    ]).listen((data) {
      print(data);
    }, onError: (e){
      print(e.message);
    }, onDone: (){
      print("done");
    });
  }

  //使用 async/await 消除 callback hell
  task() async {
    try{
      String id = await login("alice","******");
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);
      //执行接下来的操作
    } catch(e){
      //错误处理
      print(e);
    }
  }

//函数作为参数传递
//定义函数execute，它的参数类型为函数
  void execute(var callback) {
    callback(); //执行传入的函数
  }

  String say2(String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  void enablkeFlags({required bool bold, required bool hidden}) {
    //....

  }
}

class Person{
  say(){
    print('say');
  }
}

mixin Eat{
  eat(){
    print("eat");
  }
}

mixin Walk{
  walk(){
    print('walk');
  }
}

mixin Code{
  code(){
    print('key');
  }
}

class Dog with Eat, Walk{}

//mixin 与 with 配合使用
class Man extends Person with Eat, Walk, Code{}

