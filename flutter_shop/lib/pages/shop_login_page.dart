import 'package:flutter/material.dart';
// 1.创建组件
class LoginPage extends StatefulWidget {
  // 2.创建初始化方法
  const LoginPage({Key? key}) : super(key: key);
  // 3.重写createState()方法
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 4.重写build(BuildContext context)方法
  @override
  Widget build(BuildContext context) {
    // 5.只要有"导航栏/分栏"就需要加Scaffold
    return Scaffold(
      // https://blog.csdn.net/qq_40638618/article/details/112466293
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset(
          'assets/appBarItem/shop_appbar_back.png',
          width: 15,
          height: 15,
          color: Colors.black
        ),
        title: const Text(
          '登录',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0
          ),
        ),
        actions: [
          // Avoid unnecessary containers. - 避免不必要的容器
          Container(
            padding: const EdgeInsets.only(right: 20.0),
            child: const Center(
              child: Text(
                '注册账号',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0
                )
              )
            )
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '账号',
            style: TextStyle(
              backgroundColor: Colors.pink
            ),
          ),
          Text(
            '密码',
            style: TextStyle(
                backgroundColor: Colors.pink
            ),
          ),
          Text(
            '登录',
            style: TextStyle(
                backgroundColor: Colors.pink
            ),
          )
        ]
      )
    );
  }
}